TERMUX_PKG_HOMEPAGE=https://lxqt.github.io
TERMUX_PKG_DESCRIPTION="The core library of LXQt"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="Simeon Huang <symeon@librehat.com>"
TERMUX_PKG_VERSION="1.2.0"
TERMUX_PKG_SRCURL="https://github.com/lxqt/liblxqt/releases/download/${TERMUX_PKG_VERSION}/liblxqt-${TERMUX_PKG_VERSION}.tar.xz"
TERMUX_PKG_SHA256=7fabc8b9b1a409cda3c31c71c18580763698522450f17577b8034ef36b6fec14
TERMUX_PKG_DEPENDS="libc++, qt5-qtbase, qt5-qtx11extras, kwindowsystem, libqtxdg, libxss"
TERMUX_PKG_BUILD_DEPENDS="lxqt-build-tools, qt5-qtbase-cross-tools"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DBUILD_BACKLIGHT_LINUX_BACKEND=OFF"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
