TARGET := iphone:clang:16.5:14.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ZImmortalizerJailed

ZImmortalizerJailed_FILES = main.m FloatingButton.m CustomToastView.m
ZImmortalizerJailed_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
