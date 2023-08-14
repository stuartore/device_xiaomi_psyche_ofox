#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2021-2023 The OrangeFox Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

# Release name
PRODUCT_RELEASE_NAME := psyche

DEVICE_PATH=device/xiaomi/psyche

# Inherit from device
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := twrp_psyche
PRODUCT_DEVICE := psyche
PRODUCT_BRAND := Xiaomi
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := 2112123AC

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
#
