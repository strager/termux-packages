TERMUX_PKG_HOMEPAGE=https://tinyproxy.github.io/
TERMUX_PKG_DESCRIPTION="Light-weight HTTP proxy daemon for POSIX operating systems"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.11.1
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://github.com/tinyproxy/tinyproxy/releases/download/${TERMUX_PKG_VERSION}/tinyproxy-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=d66388448215d0aeb90d0afdd58ed00386fb81abc23ebac9d80e194fceb40f7c
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--disable-regexcheck"

termux_step_pre_configure() {
	CPPFLAGS+=" -DLINE_MAX=_POSIX2_LINE_MAX"
}

termux_step_post_massage() {
	mkdir -p "${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/var/log/${TERMUX_PKG_NAME}"
	mkdir -p "${TERMUX_PKG_MASSAGEDIR}/${TERMUX_PREFIX}/var/run/${TERMUX_PKG_NAME}"
}
