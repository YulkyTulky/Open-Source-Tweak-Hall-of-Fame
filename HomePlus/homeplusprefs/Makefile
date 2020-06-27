include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = HomePlusPrefs

ARCHS = armv7 arm64 arm64e

HomePlusPrefs_FILES = HPPRootListController.m
HomePlusPrefs_INSTALL_PATH = /Library/PreferenceBundles
HomePlusPrefs_FRAMEWORKS = UIKit
HomePlusPrefs_PRIVATE_FRAMEWORKS = Preferences
HomePlusPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/HomePlusPrefs.plist$(ECHO_END)
