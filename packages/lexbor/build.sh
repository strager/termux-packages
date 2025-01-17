TERMUX_PKG_HOMEPAGE="https://lexbor.com"
TERMUX_PKG_DESCRIPTION="Fast embeddable web browser engine written in C with no dependencies"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.1.0"
TERMUX_PKG_SRCURL="https://github.com/lexbor/lexbor/archive/refs/tags/v$TERMUX_PKG_VERSION.tar.gz"
TERMUX_PKG_SHA256=f3aeeb0c47d9d34b7b32411ce6a8fe833b825fa21730a593c32f53c9834a3f0d
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DLEXBOR_BUILD_SHARED=ON
-DLEXBOR_BUILD_STATIC=OFF
-DLEXBOR_BUILD_EXAMPLES=OFF
-DLEXBOR_BUILD_TESTS=OFF
-DLEXBOR_BUILD_TESTS_CPP=OFF
"

