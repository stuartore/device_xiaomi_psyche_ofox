#!/sbin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2019-2023 The OrangeFox Recovery Project
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
#
# TODO: this kludge is needed to prevent issues with mounting
# system and vendor in some zip installers and in the gui
#

set_read_write_partitions() {
  local i=$(getprop "ro.orangefox.fastbootd");
  [ "$i" = "1" ] && return; # don't run this in fastbootd mode
  
  # slot
  local slot=$(getprop "ro.boot.slot_suffix");
  
  # partitions
  local Parts="system system_ext vendor product odm";
  
  # loop through
  for i in ${Parts}
  do
     echo "I:OrangeFox: setting $i to read/write" >> /tmp/recovery.log;
     blockdev --setrw /dev/block/mapper/$i"$slot";
  done
}

# check whether the unified-script has been executed
check_unified_script() {
local i=$(getprop "ro.product.device");
  if [ "$i" = "psyche" ]; then
	# something went wrong - run the unified script manually
	echo "I:OrangeFox: something is not right. Running the unified-script again" >> /tmp/recovery.log;
	/system/bin/unified-script.sh;
  fi
}

set_read_write_partitions;
check_unified_script;
exit 0;
