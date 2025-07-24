#
# Copyright (C) 2021
# The PBRP (Pitch Black Recovery Project)
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
#

# Base configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Common PBRP configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Device-specific configuration
$(call inherit-product, device/xiaomi/ares/device.mk)

# Device identity
PRODUCT_DEVICE := ares
PRODUCT_NAME := pbrp_ares
PRODUCT_BRAND := Poco
PRODUCT_MODEL := POCO F3 GT
PRODUCT_MANUFACTURER := Xiaomi

# PBRP Flags
PBRP_VERSION := 4.0
PB_DISABLE_DEFAULT_THEME := false
PB_TORCH_PATH := "/sys/class/leds/led:torch_0"
PB_DISABLE_NOTCH := true
PB_ENABLE_ADB_USB := true

# PBRP-specific flags
PBRP_DEVICE_MAINTAINER := ツ๛abrohim๛
PBRP_DEVICE := POCO F3 GT/Redmi K40 Gaming
PBRP_VERSION := 4.0
