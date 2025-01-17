TERMUX_PKG_HOMEPAGE=https://flacon.github.io/
TERMUX_PKG_DESCRIPTION="Extracts individual tracks from one big audio file and saves them as separate audio files"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=10.0.0
TERMUX_PKG_SRCURL=https://github.com/flacon/flacon/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=f08bc2744e1d27de810e288dc20fdf2bf7149a33c695a677ab8bec075bcd7675
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_DEPENDS="libc++, libuchardet, qt5-qtbase, taglib"
TERMUX_PKG_BUILD_DEPENDS="qt5-qtbase-cross-tools, qt5-qttools-cross-tools"
