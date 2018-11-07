#
# Copyright 2018 The Maru OS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#$(call inherit-product, device/htc/full_flounder.mk)
$(call inherit-product, vendor/maruos/device-maru.mk)
$(call inherit-product, vendor/maruos/BoardConfigVendor.mk)

# Include LineageOS stuff
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/htc/flounder/aosp_flounder.mk)

$(call inherit-product-if-exists, vendor/htc/flounder/device-vendor.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2048
TARGET_SCREEN_WIDTH := 1536

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/htc/flounder
TARGET_KERNEL_CONFIG := maru_flounder_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# Extra Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras

# Lineage overlays
DEVICE_PACKAGE_OVERLAYS += device/htc/flounder/overlay-lineage

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=flounder \
    PRIVATE_BUILD_DESC="volantis-user 7.1.1 N9F27M 4333998 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := google/volantis/flounder:7.1.1/N9F27M/4333998:user/release-keys

# Vendor security patch level
PRODUCT_PROPERTY_OVERRIDES += \
    ro.lineage.build.vendor_security_patch=2017-10-05

## Device identifier. This must come after all inclusions
PRODUCT_NAME := maru_flounder
PRODUCT_BRAND := google
PRODUCT_MODEL := Maru on the Nexus 9
