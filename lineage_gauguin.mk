#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from gauguin device
$(call inherit-product, device/xiaomi/gauguin/device.mk)

PRODUCT_DEVICE := gauguin
PRODUCT_NAME := lineage_gauguin
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Gauguin
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gauguin-user 12 RKQ1.200826.002 V14.0.2.0.SJSCNXM release-keys"

BUILD_FINGERPRINT := Redmi/gauguin/gauguin:12/RKQ1.200826.002/V14.0.2.0.SJSCNXM:user/release-keys
