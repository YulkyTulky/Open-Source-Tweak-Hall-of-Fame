ARCHS = arm64 arm64e
TARGET = iphone:clang::13.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RoseSpotify
$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS += -fobjc-arc
$(TWEAK_NAME)_LIBRARIES += Rose
$(TWEAK_NAME)_FRAMEWORKS += UIKit
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk