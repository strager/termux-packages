TERMUX_PKG_HOMEPAGE=https://libxlsxwriter.github.io/
TERMUX_PKG_DESCRIPTION="A C library for creating Excel XLSX files"
TERMUX_PKG_LICENSE="BSD 2-Clause, BSD 3-Clause, ZLIB, MPL-2.0, MIT, Public Domain"
TERMUX_PKG_LICENSE_FILE="License.txt"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.1.5
TERMUX_PKG_SRCURL=https://github.com/jmcnamara/libxlsxwriter/archive/refs/tags/RELEASE_${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=12843587d591cf679e6ec63ecc629245befec2951736804a837696cdb5d61946
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_UPDATE_VERSION_REGEXP="\d+.\d+.\d+"
TERMUX_PKG_DEPENDS="zlib"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DBUILD_SHARED_LIBS=ON"

termux_step_post_get_source() {
	# Do not forget to bump revision of reverse dependencies and rebuild them
	# after SOVERSION is changed.
	local _SOVERSION=5

	local v=$(sed -En 's/.*LXW_SOVERSION .*"(.*)".*/\1/p' \
			include/xlsxwriter.h)
	if [ "${v}" != "${_SOVERSION}" ]; then
		termux_error_exit "SOVERSION guard check failed."
	fi
}
