DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES  +=\
    $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/config/fw_4319_apsta.bin:system/etc/fw_4319_apsta.bin \
    $(LOCAL_PATH)/config/fw_4319.bin:system/etc/fw_4319.bin\
    $(LOCAL_PATH)/nv_4319.txt:system/etc/nv_4319.txt\
    $(LOCAL_PATH)/test_4319.bin:system/etc/test_4319.bin

# Key layout ank keychar binaries
PRODUCT_COPY_FILES +=\
    $(LOCAL_PATH)/keyfiles/qwerty2.kcm.bin:system/usr/keychars/qwerty.bin \
    $(LOCAL_PATH)/keyfiles/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    $(LOCAL_PATH)/keyfiles/qwerty.kl:system/usr/keylayout/qwerty.kl \
    $(LOCAL_PATH)/keyfiles/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/keyfiles/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/keyfiles/roamer_keypad.kl:system/usr/keylayout/roamer_keypad.kl

PRODUCT_PACKAGES += \
    camera.msm7k \
    copybit.msm7k \
    gralloc.msm7k \
    hwcomposer.msm7k \
    gps.msm7k \
    audio.primary.msm7k \
    audio_policy.msm7k \
    audio.a2dp.default

PRODUCT_PACKAGES += \
    hciconfig \
    hcitool \
    libaudioutils

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel\
    device/zte/roamer/recovery/sbin/recovery.sh:/root/sbin/recovery.sh\
    device/zte/roamer/recovery/sbin/usbconfig:/root/sbin/usbconfig\
    device/zte/roamer/recovery/etc/usb.conf:/root/usb.conf
