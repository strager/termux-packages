TERMUX_PKG_HOMEPAGE=https://neomutt.org/
TERMUX_PKG_DESCRIPTION="A version of mutt with added features"
# License: GPL-2.0-or-later
TERMUX_PKG_LICENSE="GPL-2.0, GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=20230322
TERMUX_PKG_SRCURL=https://github.com/neomutt/neomutt/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=47f024d4ae2d976f95b626c5fe6cad6ef22ed187426efbd7cf61435ba1790a48
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_UPDATE_VERSION_REGEXP="\d{8}"
TERMUX_PKG_DEPENDS="gdbm, krb5, libandroid-support, libiconv, libsasl, ncurses, notmuch, openssl, zlib, zstd"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_CONFFILES="etc/neomuttrc"

termux_step_configure() {
	./configure --host=$TERMUX_HOST_PLATFORM \
		--sysroot=$TERMUX_PREFIX \
		--prefix=$TERMUX_PREFIX --with-mailpath=$TERMUX_PREFIX/var/mail \
		--notmuch \
		--disable-gpgme --disable-idn --zlib --zstd --sasl --ssl --gdbm --gss
}
