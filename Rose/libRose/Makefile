ARCHS = arm64 arm64e
TARGET = iphone:clang::13.4

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = librose
$(LIBRARY_NAME)_OBJC_FILES = $(wildcard *.m)
$(LIBRARY_NAME)_CFLAGS = -I./
$(LIBRARY_NAME)_FRAMEWORKS += UIKit
$(LIBRARY_NAME)_USE_MODULES = 0

ADDITIONAL_CFLAGS = -Ipublic -Ioverlayheaders -I. -fobjc-arc

include $(THEOS_MAKE_PATH)/library.mk

stage::
	mkdir -p $(THEOS_STAGING_DIR)/usr/include/librose
	$(ECHO_NOTHING)rsync -a ./public/* $(THEOS_STAGING_DIR)/usr/include/Rose $(FW_RSYNC_EXCLUDES)$(ECHO_END)
	mkdir -p $(THEOS)/include/Rose
	cp -r ./public/* $(THEOS)/include/Rose
	cp $(THEOS_STAGING_DIR)/usr/lib/librose.dylib $(THEOS)/lib/librose.dylib