TERMUX_PKG_HOMEPAGE=https://github.com/sharkdp/pastel
TERMUX_PKG_DESCRIPTION="A command-line tool to generate, analyze, convert and manipulate colors"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE-MIT, LICENSE-APACHE"
TERMUX_PKG_MAINTAINER="Yaksh Bariya <yakshbari4@gmail.com>"
TERMUX_PKG_VERSION="0.9.0"
TERMUX_PKG_SRCURL=https://github.com/sharkdp/pastel/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=473c805de42f6849a4bb14ec103ca007441f355552bdb6ebc80b60dac1f3a95d
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	SHELL_COMPLETIONS_DIR=$TERMUX_PKG_BUILDDIR/completions cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm755 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/pastel

	# Install completions
	install -Dm600 $TERMUX_PKG_BUILDDIR/completions/_pastel \
		$TERMUX_PREFIX/share/zsh/site-functions/_pastel
	install -Dm600 $TERMUX_PKG_BUILDDIR/completions/pastel.bash \
		$TERMUX_PREFIX/share/bash-completion/completions/pastel.bash
	install -Dm600 $TERMUX_PKG_BUILDDIR/completions/pastel.fish \
		$TERMUX_PREFIX/share/fish/vendor_completions.d/pastel.fish
}
