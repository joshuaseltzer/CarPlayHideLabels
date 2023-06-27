ifeq ($(THEOS_PACKAGE_SCHEME),rootless)
TARGET=iphone:clang:16.2:15.0
ARCHS=arm64 arm64e
else
TARGET=iphone:clang:14.5:7.0
ARCHS=armv7 arm64 arm64e
endif

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CarPlayHideLabels

CarPlayHideLabels_FILES = Tweak.x
CarPlayHideLabels_CFLAGS = -fobjc-arc

THEOS_PACKAGE_BASE_VERSION = 1.0.1
_THEOS_INTERNAL_PACKAGE_VERSION = 1.0.1

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 CarPlay; killall -9 SpringBoard"
