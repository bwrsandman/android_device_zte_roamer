
# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/cyanogen/products/gsm.mk)

# Inherit device configuration
$(call inherit-product, device/zte/roamer/device_roamer.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_roamer
PRODUCT_BRAND := zte
PRODUCT_DEVICE := roamer
PRODUCT_MODEL := roamer
PRODUCT_MANUFACTURER := zte

# Release name and versioning
PRODUCT_RELEASE_NAME := N760
PRODUCT_VERSION_DEVICE_SPECIFIC :=
-include vendor/cyanogen/products/common_versions.mk

#
# Copy  specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
