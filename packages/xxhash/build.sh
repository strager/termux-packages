TERMUX_PKG_HOMEPAGE=https://cyan4973.github.io/xxHash/
TERMUX_PKG_DESCRIPTION="Extremely fast non-cryptographic hash algorithm"
TERMUX_PKG_LICENSE="BSD, GPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.8.1
TERMUX_PKG_SRCURL=https://github.com/Cyan4973/xxHash/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=3bb6b7d6f30c591dd65aaaff1c8b7a5b94d81687998ca9400082c739a690436c
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_ENABLE_CLANG16_PORTING=false
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_post_massage() {
	# Do not forget to bump revision of reverse dependencies and rebuild them
	# after SOVERSION is changed.
	local _SOVERSION_GUARD_FILES="lib/libxxhash.so.0"
	local f
	for f in ${_SOVERSION_GUARD_FILES}; do
		if [ ! -e "${f}" ]; then
			termux_error_exit "SOVERSION guard check failed."
		fi
	done
}
