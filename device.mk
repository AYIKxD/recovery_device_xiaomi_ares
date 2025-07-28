#
# Copyright (C) 2021 The TWRP Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Platform
PRODUCT_SHIPPING_API_LEVEL := 31
PRODUCT_PLATFORM := mt6893  # Add your chipset (MediaTek Dimensity 1200)

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Virtual A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B Partitions
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
    boot \
    dtbo \
    system \
    system_ext \
    product \
    vendor \
    odm \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# OTA Postinstall (Fix: Use correct path for your device)
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \  # Replace with your device's script
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

# Boot Control HAL (MediaTek-specific)
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl.recovery \
    android.hardware.boot@1.2-mtkimpl \
    libmtk_bsg.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

# Health HAL
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Keymaster Libraries (Critical for decryption)
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Vibrator (Fix: Ensure init.vibrator.rc exists in your device tree)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.vibrator.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.vibrator.rc

# PBRP-Specific Additions (Add these if missing)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/init.recovery.qcom.rc:root/init.recovery.qcom.rc  # Example for Qualcomm, adjust for MediaTek
