#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/ares

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# A/B
ENABLE_VIRTUAL_AB := true
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# A/B
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true
    
PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.1-impl.recovery

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Additional target Libraries
TARGET_RECOVERY_DEVICE_MODULES += \
    libkeymaster4 \
    libpuresoftkeymasterdevice

TW_RECOVERY_ADDITIONAL_RELINK_LIBRARY_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libkeymaster4.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libpuresoftkeymasterdevice.so

# Copy all necessary files from recovery/root to the output image
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/root/microtrust.rc:root/microtrust.rc \
    $(LOCAL_PATH)/recovery/root/init.recovery.mt6893.rc:root/init.recovery.mt6893.rc \
    $(LOCAL_PATH)/recovery/root/ueventd.mt6893.rc:root/ueventd.mt6893.rc \
    $(LOCAL_PATH)/recovery/root/tee-supplicant.rc:root/tee-supplicant.rc \
    $(LOCAL_PATH)/recovery/root/miteelog.rc:root/miteelog.rc \
    $(LOCAL_PATH)/recovery/root/system/bin/android.hardware.keymaster@4.0-service.beanpod:system/bin/android.hardware.keymaster@4.0-service.beanpod \
    $(LOCAL_PATH)/recovery/root/system/bin/android.hardware.keymaster@4.0-service.mitee:system/bin/android.hardware.keymaster@4.0-service.mitee \
    $(LOCAL_PATH)/recovery/root/system/bin/tee-supplicant:system/bin/tee-supplicant \
    $(LOCAL_PATH)/recovery/root/system/bin/teei_daemon:system/bin/teei_daemon \
    $(LOCAL_PATH)/recovery/root/system/bin/android.hardware.gatekeeper@1.0-service:system/bin/android.hardware.gatekeeper@1.0-service \
    $(LOCAL_PATH)/recovery/root/system/bin/miteelog:system/bin/miteelog \
    $(LOCAL_PATH)/recovery/root/system/bin/mtk_plpath_utils:system/bin/mtk_plpath_utils \
    $(LOCAL_PATH)/recovery/root/system/lib64/hw/android.hardware.fastboot@1.0-impl-mtk.so:system/lib64/hw/android.hardware.fastboot@1.0-impl-mtk.so \
    $(LOCAL_PATH)/recovery/root/system/lib64/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so:system/lib64/hw/android.hardware.boot@1.0-impl-1.2-mtkimpl.so \
    $(LOCAL_PATH)/recovery/root/system/etc/twrp.flags:system/etc/twrp.flags \
    $(LOCAL_PATH)/recovery/root/system/etc/task_profiles.json:system/etc/task_profiles.json \
    $(LOCAL_PATH)/recovery/root/system/etc/vintf/manifest.xml:system/etc/vintf/manifest.xml \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libTEECommon.so:vendor/lib64/libTEECommon.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/libteecli.so:vendor/lib64/libteecli.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/gatekeeper.beanpod.so:vendor/lib64/hw/gatekeeper.beanpod.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/gatekeeper.mitee.so:vendor/lib64/hw/gatekeeper.mitee.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so:vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/libSoftGatekeeper.so:vendor/lib64/hw/libSoftGatekeeper.so \
    $(LOCAL_PATH)/recovery/root/vendor/lib64/hw/libimsg_log.so:vendor/lib64/hw/libimsg_log.so \
    $(LOCAL_PATH)/recovery/root/vendor/etc/vintf/manifest.xml:vendor/etc/vintf/manifest.xml \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/14b0aad8-c011-4a3f-b66aca8d0e66f273.ta:vendor/mitee/ta/14b0aad8-c011-4a3f-b66aca8d0e66f273.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/377ee4e8-af0e-474f-a9d636a9268fe85c.ta:vendor/mitee/ta/377ee4e8-af0e-474f-a9d636a9268fe85c.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/3d08821c-33a6-11e6-a1fa089e01c83aa2.ta:vendor/mitee/ta/3d08821c-33a6-11e6-a1fa089e01c83aa2.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/4d573443-6a56-4272-ac6f2425af9ef9bb.ta:vendor/mitee/ta/4d573443-6a56-4272-ac6f2425af9ef9bb.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/68bcd09d-4101-4c0a-9552ed0af9ae16b2.ta:vendor/mitee/ta/68bcd09d-4101-4c0a-9552ed0af9ae16b2.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/7b30b820-a9ea-11e5-b1780002a5d5c51b.ta:vendor/mitee/ta/7b30b820-a9ea-11e5-b1780002a5d5c51b.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/86f623f6-a299-4dfd-b560ffd3e5a62c29.ta:vendor/mitee/ta/86f623f6-a299-4dfd-b560ffd3e5a62c29.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/88ce8e6b-8646-4092-bb78faf5b55ff4df.ta:vendor/mitee/ta/88ce8e6b-8646-4092-bb78faf5b55ff4df.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/8aaaf201-2460-0000-7143fe4f7c823c80.ta:vendor/mitee/ta/8aaaf201-2460-0000-7143fe4f7c823c80.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/a985d3eb-3b52-4d44-be6c628a813561e8.ta:vendor/mitee/ta/a985d3eb-3b52-4d44-be6c628a813561e8.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/dba51a17-0563-11e7-93b16fa7b0071a51.ta:vendor/mitee/ta/dba51a17-0563-11e7-93b16fa7b0071a51.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/e5140b33-76fa-4c63-ab18062caab2fb5c.ta:vendor/mitee/ta/e5140b33-76fa-4c63-ab18062caab2fb5c.ta \
    $(LOCAL_PATH)/recovery/root/vendor/mitee/ta/f13010e0-2ae1-11e5-896a0002a5d5c51d.ta:vendor/mitee/ta/f13010e0-2ae1-11e5-896a0002a5d5c51d.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/020f0000000000000000000000000000.ta:vendor/thh/ta/020f0000000000000000000000000000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/05120000000000000000000000000000.ta:vendor/thh/ta/05120000000000000000000000000000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/06090000000000000000000000000000.ta:vendor/thh/ta/06090000000000000000000000000000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/08010203000000000000000000000000.ta:vendor/thh/ta/08010203000000000000000000000000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/08030000000000000000000000000000.ta:vendor/thh/ta/08030000000000000000000000000000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/08110000000000000000000000000000.ta:vendor/thh/ta/08110000000000000000000000000000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/14498ace2a8f11e880c8509a4c146f4c.ta:vendor/thh/ta/14498ace2a8f11e880c8509a4c146f4c.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/3d08821c33a611e6a1fa089e01c83aa2.ta:vendor/thh/ta/3d08821c33a611e6a1fa089e01c83aa2.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/40188311faf343488db888ad39496f9a.ta:vendor/thh/ta/40188311faf343488db888ad39496f9a.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/5020170115e016302017012521300000.ta:vendor/thh/ta/5020170115e016302017012521300000.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/7778c03fc30c4dd0a319ea29643d4d4b.ta:vendor/thh/ta/7778c03fc30c4dd0a319ea29643d4d4b.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/86f623f6a2994dfdb560ffd3e5a62c29.ta:vendor/thh/ta/86f623f6a2994dfdb560ffd3e5a62c29.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/8888c03fc30c4dd0a319ea29643d4d4b.ta:vendor/thh/ta/8888c03fc30c4dd0a319ea29643d4d4b.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/8aaaf201246000007143fe4f7c823c80.ta:vendor/thh/ta/8aaaf201246000007143fe4f7c823c80.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/9073f03a9618383bb1856eb3f990babd.ta:vendor/thh/ta/9073f03a9618383bb1856eb3f990babd.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/93feffccd8ca11e796c7c7a21acb4932.ta:vendor/thh/ta/93feffccd8ca11e796c7c7a21acb4932.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/a985d3eb3b524d44be6c628a813561e8.ta:vendor/thh/ta/a985d3eb3b524d44be6c628a813561e8.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/abcd270ea5c44c58bcd3384a2fa2539e.ta:vendor/thh/ta/abcd270ea5c44c58bcd3384a2fa2539e.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/c09c9c5daa504b78b0e46eda61556c3a.ta:vendor/thh/ta/c09c9c5daa504b78b0e46eda61556c3a.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/c1882f2d885e4e13a8c8e2622461b2fa.ta:vendor/thh/ta/c1882f2d885e4e13a8c8e2622461b2fa.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/d78d338b1ac349e09f65f4efe179739d.ta:vendor/thh/ta/d78d338b1ac349e09f65f4efe179739d.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/d91f322ad5a441d5955110eda3272fc0.ta:vendor/thh/ta/d91f322ad5a441d5955110eda3272fc0.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/e5140b3376fa4c63ab18062caab2fb5c.ta:vendor/thh/ta/e5140b3376fa4c63ab18062caab2fb5c.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/e97c270ea5c44c58bcd3384a2fa2539e.ta:vendor/thh/ta/e97c270ea5c44c58bcd3384a2fa2539e.ta \
    $(LOCAL_PATH)/recovery/root/vendor/thh/ta/isee_model.json:vendor/thh/ta/isee_model.json
