TARGET=iphone:clang:11.2:7.0
ARCHS=armv7 arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CarPlayHideLabels

CarPlayHideLabels_FILES = Tweak.x
CarPlayHideLabels_CFLAGS = -fobjc-arc

THEOS_PACKAGE_BASE_VERSION = 1.0.0
_THEOS_INTERNAL_PACKAGE_VERSION = 1.0.0

include $(THEOS_MAKE_PATH)/tweak.mk
