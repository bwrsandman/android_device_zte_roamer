USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/zte/roamer/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi
TARGET_BOOTLOADER_BOARD_NAME := roamer

#WiFI related definitions
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
WPA_SUPPLICANT_VERSION           := VER_0_6_X
BOARD_WLAN_DEVICE                := BCM4319
WIFI_BAND                        := 802_11_ABG
WIFI_DRIVER_MODULE_PATH          := "/lib/modules/dhd.ko"
WIFI_DRIVER_FW_PATH_STA          := "/vendor/firmware/fw_bcm4319.bin"
WIFI_DRIVER_FW_PATH_AP           := "/vendor/firmware/fw_bcm4319_apsta.bin"
WIFI_DRIVER_MODULE_NAME          := "dhd"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan0 firmware_path=/vendor/firmware/fw_bcm4319.bin nvram_path=/vendor/firmware/nv4319.txt"

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x02600000
BOARD_PAGE_SIZE := 0x00000800

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x0dc00000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x0a280000
BOARD_FLASH_BLOCK_SIZE := 0x00020000

TARGET_PREBUILT_KERNEL := device/zte/roamer/kernel
TARGET_RECOVERY_INITRC := device/zte/roamer/recovery/etc/init.rc

BOARD_DATA_DEVICE := /dev/block/mtdblock6
BOARD_DATA_FILESYSTEM := auto
BOARD_DATA_FILESYSTEM_OPTIONS := rw
BOARD_SYSTEM_DEVICE := /dev/block/mtdblock5
BOARD_SYSTEM_FILESYSTEM := auto
BOARD_SYSTEM_FILESYSTEM_OPTIONS := rw
BOARD_CACHE_DEVICE := /dev/block/mtdblock4
BOARD_CACHE_FILESYSTEM := auto
BOARD_CACHE_FILESYSTEM_OPTIONS := rw

BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/zte/roamer/recovery/recovery_ui.c

BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun

BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun0/file"

