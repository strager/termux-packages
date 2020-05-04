TERMUX_PKG_HOMEPAGE=https://www.xfce.org/
TERMUX_PKG_DESCRIPTION="A desktop manager for XFCE environment"
TERMUX_PKG_LICENSE="GPL-2.0"
TERMUX_PKG_MAINTAINER="Leonid Plyushch <leonid.plyushch@gmail.com>"
TERMUX_PKG_VERSION=4.14.2
TERMUX_PKG_REVISION=6
TERMUX_PKG_SRCURL=http://archive.xfce.org/src/xfce/xfdesktop/${TERMUX_PKG_VERSION:0:4}/xfdesktop-${TERMUX_PKG_VERSION}.tar.bz2
TERMUX_PKG_SHA256=a30534461fea907f969f608a11c84be0b1aaad687c591c32cd56a9d274ea3e74
TERMUX_PKG_DEPENDS="exo, garcon, hicolor-icon-theme, libwnck, libxfce4ui, startup-notification, thunar"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="--enable-notifications"
