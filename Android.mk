LOCAL_PATH := $(call my-dir)

ifneq ($(TARGET_BOOTLOADER_BOARD_NAME), roamer)
    include $(call all-named-subdir-makefiles, recovery libaudio libril libcamera libgralloc libcopybit)
endif
