#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Enable project quotas and casefolding for f2fs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Installs fstab
PRODUCT_PACKAGES += \
    fstab.serenity

# File systems compression
PRODUCT_FS_COMPRESSION := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Device identifier
PRODUCT_NAME := serenity
PRODUCT_DEVICE := serenity
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi A5
PRODUCT_MANUFACTURER := Xiaomi

# Project ID Quota
PRODUCT_QUOTA_PROPERTIES := \
    ro.crypto.volume.filenames_mode=aes-256-cts

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 35

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)
