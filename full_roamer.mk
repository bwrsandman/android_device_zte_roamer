$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/zte/roamer/device.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/zte/roamer/roamer-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/roamer/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/zte/roamer/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_roamer
PRODUCT_DEVICE := roamer

pathmap_INCL := recovery:device/zte/roamer/recovery


