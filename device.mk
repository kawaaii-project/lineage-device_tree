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
    shutdown.sh \
    water_cooling_check.sh \
    init.mdm.sh \
    init.qcom.sh \
    init.crda.sh \
    init.qcom.coex.sh \
    init.qcom.early_boot.sh \
    init.qcom.post_boot.sh \
    init.qcom.class_core.sh \
    headsetstate.sh \
    qca6234-service.sh \
    powersleep.sh \
    init.qti.qcv.sh \
    init.qti.media.sh \
    teardown_loopback.sh \
    install-recovery.sh \
    setup_topmic2headphone.sh \
    playback_headset.sh \
    init.mi.usb.sh \
    mishow.sh \
    init.qcom.usb.sh \
    init.qcom.efs.sync.sh \
    playback.sh \
    init.qcom.sdio.sh \
    init.qti.dcvs.sh \
    init.class_main.sh \
    init.qti.chg_policy.sh \
    init.xiaomi.early_boot.sh \
    capture.sh \
    setup_headsetmic2headphone.sh \
    init.qcom.sensors.sh \
    setup_mainmic2headphone.sh \
    capture_headset.sh \

PRODUCT_PACKAGES += \
    fstab.emmc \
    init.qcom.factory.rc \
    init.qcom.usb.rc \
    init.target.rc \
    init.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.emmc:$(TARGET_COPY_OUT_RAMDISK)/fstab.emmc

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 29

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/gauguin/gauguin-vendor.mk)
