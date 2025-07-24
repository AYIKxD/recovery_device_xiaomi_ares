#
# Copyright (C) 2021 The PitchBlack Recovery Project
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit device-specific configurations
$(call inherit-product, device/xiaomi/ares/device.mk)

# Inherit PitchBlack base configs
$(call inherit-product, vendor/pb/config/pbrp_common.mk)

# Product Info
PRODUCT_RELEASE_NAME := ares
PRODUCT_NAME := pbrp_ares
PRODUCT_DEVICE := ares
PRODUCT_BRAND := Xiaomi
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
