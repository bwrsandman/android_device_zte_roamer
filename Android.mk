LOCAL_PATH := $(call my-dir)

ifneq ($(filter roamer,$(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
