TERMUX_PKG_HOMEPAGE="https://esa.github.io/pagmo2/index.html"
TERMUX_PKG_DESCRIPTION="Scientific library for massively parallel optimization"
TERMUX_PKG_GROUPS="science"
TERMUX_PKG_LICENSE="LGPL-3.0, GPL-3.0"
TERMUX_PKG_LICENSE_FILE="COPYING.lgpl3"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.19.0"
TERMUX_PKG_SRCURL="https://github.com/esa/pagmo2/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=701ada528de7d454201e92a5d88903dd1c22ea64f43861d9694195ddfef82a70
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_DEPENDS="libc++, boost, libtbb, eigen, nlopt"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DPAGMO_BUILD_TESTS=OFF
-DPAGMO_BUILD_BENCHMARKS=OFF
-DPAGMO_BUILD_TUTORIALS=OFF
-DPAGMO_WITH_EIGEN3=ON
-DPAGMO_WITH_NLOPT=ON
-DPAGMO_WITH_IPOPT=OFF
-DPAGMO_BUILD_STATIC_LIBRARY=OFF
"
