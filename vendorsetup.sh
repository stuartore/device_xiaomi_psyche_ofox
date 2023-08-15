#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2021-2023 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#

#set -o xtrace
FDEVICE="psyche"
THIS_DEVICE=psyche

FOX_BUILD_DEVICE="psyche"

if [[ $FOX_BUILD_DEVICE == "psyche" ]]; then
        export FOX_VANILLA_BUILD=1
    	export FOX_ENABLE_APP_MANAGER=1
	export FOX_VIRTUAL_AB_DEVICE=1
	export FOX_RECOVERY_SYSTEM_PARTITION="/dev/block/mapper/system"
	export FOX_RECOVERY_VENDOR_PARTITION="/dev/block/mapper/vendor"
	export FOX_USE_BASH_SHELL=1
	export FOX_ASH_IS_BASH=1
	export FOX_USE_TAR_BINARY=1
	export FOX_USE_SED_BINARY=1
	export FOX_USE_XZ_UTILS=1
	export FOX_USE_NANO_EDITOR=1
    	export FOX_DELETE_AROMAFM=1
    	export FOX_BUGGED_AOSP_ARB_WORKAROUND="1616300800"; # Sun 21 Mar 04:26:40 GMT 2021

	echo '[psyche]Build Guide: export ALLOW_MISSING_DEPENDENCIES=true && export ALLOW_MISSING_DEPENDENCIES=true && export LC_ALL="C" && lunch twrp_psyche-userdebug && mka adbd bootimage'

	# instruct magiskboot v24+ to always patch the vbmeta header when patching the recovery/boot image; do *not* remove!
        export FOX_PATCH_VBMETA_FLAG="1"

	# vendor_boot-as-recovery
	if [ "$FOX_VENDOR_BOOT_RECOVERY" = "1" ]; then
	   export FOX_RESET_SETTINGS="disabled"
	   export FOX_VARIANT="vBaR"
	   #export OF_USE_LZ4_COMPRESSION=1; # this can cause a bootloop in some ROMs, so don't use it
	fi
fi
