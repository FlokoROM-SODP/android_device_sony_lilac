# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Device path
DEVICE_PATH := device/sony/lilac/rootdir

DEVICE_PACKAGE_OVERLAYS += \
    device/sony/lilac/overlay

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Sensors Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Thermal Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/thermanager.xml:$(TARGET_COPY_OUT_VENDOR)/etc/thermanager.xml

# Camera Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/camera/camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camera_config.xml \
    $(DEVICE_PATH)/vendor/etc/camera/imx219_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx219_chromatix.xml \
    $(DEVICE_PATH)/vendor/etc/camera/imx400_chromatix.xml:$(TARGET_COPY_OUT_VENDOR)/etc/camera/imx400_chromatix.xml

# Audio calibration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/etc/acdbdata/Bluetooth_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Bluetooth_cal.acdb \
    $(DEVICE_PATH)/vendor/etc/acdbdata/General_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/General_cal.acdb \
    $(DEVICE_PATH)/vendor/etc/acdbdata/Global_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Global_cal.acdb \
    $(DEVICE_PATH)/vendor/etc/acdbdata/Handset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Handset_cal.acdb \
    $(DEVICE_PATH)/vendor/etc/acdbdata/Hdmi_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Hdmi_cal.acdb \
    $(DEVICE_PATH)/vendor/etc/acdbdata/Headset_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Headset_cal.acdb \
    $(DEVICE_PATH)/vendor/etc/acdbdata/Speaker_cal.acdb:$(TARGET_COPY_OUT_VENDOR)/etc/acdbdata/Speaker_cal.acdb

# BT/Wifi patch file
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/vendor/firmware/wlan/qca_cld/bdwlan.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/wlan/qca_cld/bdwlan.bin

# Device Init
PRODUCT_PACKAGES += \
    fstab.lilac \
    init.recovery.lilac \
    init.lilac \
    ueventd.lilac

# Lights
PRODUCT_PACKAGES += \
    lights.lilac

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.lilac

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.lilac

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.lilac

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=320 \
    ro.usb.pid_suffix=1F4

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/yoshino/platform.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/nxp/nxp-vendor.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/sony/yoshino-common/yoshino-partial.mk)

# include optional vendor configuration
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/build/qcom-packages.mk)
