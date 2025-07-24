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
$(call inherit-product, vendor/pbrp/config/pb_common.mk)

# Device-specific configuration
$(call inherit-product, device/xiaomi/ares/device.mk)

# Device identity
PRODUCT_DEVICE := ares
PRODUCT_NAME := pbrp_ares
PRODUCT_BRAND := POCO
PRODUCT_MODEL := M2104K10I
PRODUCT_MANUFACTURER := Xiaomi

# PBRP-specific flags
PBRP_DEVICE_MAINTAINER := ツ๛abrohim๛
PBRP_DEVICE := POCO F3 GT/Redmi K40 Gaming
PBRP_VERSION := 4.0
