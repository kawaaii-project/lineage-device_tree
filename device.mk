#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    headsetstate.sh \
    qca6234-service.sh \
    init.qcom.sensors.sh \
    shutdown.sh \
    init.qti.chg_policy.sh \
    mishow.sh \
    init.qti.media.sh \
    init.qcom.efs.sync.sh \
    init.qcom.early_boot.sh \
    init.mdm.sh \
    init.qcom.usb.sh \
    setup_mainmic2headphone.sh \
    init.qcom.sdio.sh \
    init.mi.usb.sh \
    capture_headset.sh \
    init.xiaomi.early_boot.sh \
    setup_headsetmic2headphone.sh \
    capture.sh \
    init.qcom.class_core.sh \
    init.class_main.sh \
    water_cooling_check.sh \
    setup_topmic2headphone.sh \
    init.qti.qcv.sh \
    playback.sh \
    init.qti.dcvs.sh \
    init.qcom.sh \
    teardown_loopback.sh \
    init.qcom.coex.sh \
    powersleep.sh \
    init.crda.sh \
    playback_headset.sh \
    install-recovery.sh \
    init.qcom.post_boot.sh \

PRODUCT_PACKAGES += \
    fstab.emmc \
    init.qcom.factory.rc \
    init.qcom.usb.rc \
    init.qcom.rc \
    init.target.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_COPY_OUT_RAMDISK)/fstab.emmc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/gauguin/gauguin-vendor.mk)
