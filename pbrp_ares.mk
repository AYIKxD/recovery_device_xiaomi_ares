#
# Copyright (C) 2021
# The PBRP (PitchBlack Recovery Project)
#
# Licensed under the Apache License, Version 2.0
# http://www.apache.org/licenses/LICENSE-2.0
#

# Inherit core AOSP and PBRP configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit PitchBlack Recovery common configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit device-specific configurations
$(call inherit-product, device/xiaomi/ares/device.mk)

# Device identity
PRODUCT_DEVICE := ares
PRODUCT_NAME := pbrp_ares
PRODUCT_BRAND := POCO
PRODUCT_MODEL := POCO F3 GT
PRODUCT_MANUFACTURER := Xiaomi

# PBRP Flags (Critical for functionality)
PB_TORCH_PATH := "/sys/class/leds/led:torch_0/brightness"  # Fixed torch path
PB_DISABLE_DEFAULT_THEME := false
PB_DISABLE_NOTCH := true
PB_ENABLE_ADB_USB := true

# PBRP Metadata (Must be unique)
PBRP_DEVICE := ares
PBRP_DEVICE_MAINTAINER := ツ๛abrohim๛
PBRP_DEVICE_MODEL := POCO F3 GT/Redmi K40 Gaming
PBRP_VERSION := 4.0
PBRP_BUILD_TYPE := Unofficial  # Add if custom build
