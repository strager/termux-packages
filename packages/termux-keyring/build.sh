TERMUX_PKG_HOMEPAGE=https://github.com/termux
TERMUX_PKG_DESCRIPTION="GPG public keys for the official Termux repositories"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=3.11
TERMUX_PKG_SKIP_SRC_EXTRACT=true
TERMUX_PKG_PLATFORM_INDEPENDENT=true
TERMUX_PKG_ESSENTIAL=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false

termux_step_make_install() {
	local GPG_SHARE_DIR="$TERMUX_PREFIX/share/termux-keyring"

	mkdir -p $GPG_SHARE_DIR

	# Maintainer-specific keys.
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/agnostic-apollo.gpg $GPG_SHARE_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/grimler.gpg $GPG_SHARE_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/kcubeterm.gpg $GPG_SHARE_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/landfillbaby.gpg $GPG_SHARE_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/mradityaalok.gpg $GPG_SHARE_DIR
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/2096779623.gpg $GPG_SHARE_DIR

	# Key for automatic builds (via CI).
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/termux-autobuilds.gpg $GPG_SHARE_DIR

	# Key for pacman package manager.
	install -Dm600 $TERMUX_PKG_BUILDER_DIR/termux-pacman.gpg $GPG_SHARE_DIR

	for GPG_DIR in "$TERMUX_PREFIX/etc/apt/trusted.gpg.d" "$TERMUX_PREFIX/share/pacman/keyrings"; do
		mkdir -p $GPG_DIR
		for GPG_FILE in $GPG_SHARE_DIR/*.gpg; do
			if [[ "$GPG_DIR" == *"/apt/"* && "$GPG_FILE" == *"termux-pacman.gpg"* ]]; then
				continue
			fi
			ln -s "$GPG_FILE" "$GPG_DIR/$(basename $GPG_FILE)"
		done
		# Creation of trusted files
		if [[ "$GPG_DIR" == *"/pacman/"* ]]; then
			echo "998DE27318E867EA976BA877389CEED64573DFCA:4:" > $GPG_DIR/termux-pacman-trusted
		fi
	done
}

termux_step_create_debscripts() {
	if [ "$TERMUX_PACKAGE_FORMAT" = "pacman" ]; then
		echo "if [ ! -d $TERMUX_PREFIX/etc/pacman.d/ ]; then" > postupg
		echo "  pacman-key --init" >> postupg
		echo "fi" >> postupg
		echo "pacman-key --populate" >> postupg
		echo "post_upgrade" > postinst
	fi
}
