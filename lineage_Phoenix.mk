#
# Copyright (C) 2018-2019 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Device Stuff
$(call inherit-product, device/nokia/Phoenix/device.mk)

# Inherit some common PixelExperience stuff.
TARGET_BOOT_ANIMATION_RES := 1080
TARGET_GAPPS_ARCH := arm64
TARGET_INCLUDE_STOCK_ARCORE := true
TARGET_SUPPORTS_GOOGLE_RECORDER := true
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# A/B updater
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    system \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_engine_sideload \
    update_verifier

# The following modules are included in debuggable builds only.
PRODUCT_PACKAGES_DEBUG += \
    bootctl \
    update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.sdm710 \
    bootctrl.sdm710.recovery
	
# Recovery
TARGET_RECOVERY_FSTAB := device/nokia/Phoenix/rootdir/etc/fstab.qcom

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_Phoenix
PRODUCT_DEVICE := Phoenix
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 8.1
PRODUCT_MANUFACTURER := Nokia

BUILD_FINGERPRINT := "Nokia/Phoenix_00WW/PNX_sprout:10/QKQ1.190828.002/00WW_4_31A:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="PNX_00WW_FIH-user 10 QKQ1.190828.002 00WW_4_31A release-keys" \
    PRODUCT_NAME="Phoenix"

PRODUCT_GMS_CLIENTID_BASE := android-nokia

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
