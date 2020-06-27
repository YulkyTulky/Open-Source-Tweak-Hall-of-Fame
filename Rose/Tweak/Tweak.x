#import "Rose.h"
#import <Rose/librose.h>

roseCall* haptics;

// Taptic Engine Feedback generator
UIImpactFeedbackGenerator *gen;

// Option Switches
BOOL enabled;
BOOL enableTapticEngineSwitch;
BOOL enableHapticEngineSwitch;
BOOL enableLegacyEngineSwitch;

// Feedback Strength Segmented Controls, Custom Legacy Settings And Delay Slider
NSString* tapticLevel;
NSString* hapticLevel;
NSString* legacyLevel;
NSString* customlegacyDurationLevel;
NSString* customlegacyStrengthLevel;

int tapticLVL;
int hapticLVL;
double delayLVL;
int selectedLegacyMode;
double customLegacyDuration;
double customLegacyStrength;

// Switches To Enable Sections
BOOL anywhereSectionSupportSwitch;
BOOL controlCenterSectionSupportSwitch;
BOOL hardwareButtonsSectionSupportSwitch;
BOOL homescreenSectionSupportSwitch;
BOOL lockscreenSectionSupportSwitch;
BOOL otherHardwareActionsSectionSupportSwitch;
BOOL statusChangesSectionSupportSwitch;
BOOL systemWideSectionSupportSwitch;
BOOL extrasSectionSupportSwitch;
BOOL exceptionsSectionSupportSwitch;

// Anywhere Section
BOOL killingSwitch;
BOOL switcherSwitch;
BOOL siriSwitch;
BOOL screenshotSwitch;
BOOL reachabilitySwitch;
BOOL textSelectionSwitch;
BOOL powerSwitch;
BOOL respringSwitch;
BOOL keyboardSwitch;
BOOL enterBackgroundSwitch;
BOOL alertAppearSwitch;
BOOL alertDisappearSwitch;

// Control Center Section
BOOL ccToggleSwitch;
BOOL openControlCenterSwitch;
BOOL ccModuleSwitch;

// Hardware Buttons
BOOL volumeSwitch;
BOOL sleepButtonSwitch;
BOOL ringerSwitch;

// Homescreen Section
BOOL forceSwitch;
BOOL folderOpenSwitch;
BOOL folderCloseSwitch;
BOOL iconTapSwitch;
BOOL pageSwipeSwitch;
BOOL spotlightSwitch;

// Lockscreen Section
BOOL passcodeSwitch;
BOOL quickActionsButtonSwitch;

// Other Hardware Actions Section
BOOL wakeSwitch;
BOOL pluggedSwitch;
BOOL connectBluetoothDeviceSwitch;

// Status Changes Section
BOOL unlockSwitch;
BOOL lockSwitch;
BOOL authenticationSwitch;
BOOL callSwitch;

// System Wide Section
BOOL UIButtonSwitch;
BOOL UIButtonBarButtonSwitch;
BOOL UITabBarButtonSwitch;
BOOL UIImageViewSwitch;
BOOL UIViewSwitch;
BOOL UIWindowSwitch;

// Additionals Section
BOOL lockAnimationSwitch;

// Enable App Support Switches
BOOL apolloSupportSwitch;
BOOL calculatorSupportSwitch;
BOOL facebookSupportSwitch;
BOOL instagramSupportSwitch;
BOOL musicSupportSwitch;
BOOL phoneSupportSwitch;
BOOL safariSupportSwitch;
BOOL sileoSupportSwitch;
BOOL spotifySupportSwitch;
BOOL tiktokSupportSwitch;
BOOL twitterSupportSwitch;

// Delay
BOOL delaySwitch;
NSString* delayLevel;

// Low Power Mode And DND Mode Recognition
BOOL LowPowerMode;
BOOL LowPowerModeSwitch;
BOOL isDNDActive;
BOOL isDNDActiveSwitch;
BOOL isRingerSilent;
BOOL isRingerSilentSwitch;

// Anywhere Section (Custom)
NSString* customStrengthKillingControl;
NSString* customStrengthSwitcherControl;
NSString* customStrengthSiriControl;
NSString* customStrengthScreenshotControl;
NSString* customStrengthReachabilityControl;
NSString* customStrengthTextSelectionControl;
NSString* customStrengthPowerDownControl;
NSString* customStrengthRespringControl;
NSString* customStrengthKeyboardControl;
NSString* customStrengthEnterBackgroundControl;
NSString* customStrengthAlertAppearControl;
NSString* customStrengthAlertDisappearControl;

// Control Center Section (Custom)
NSString* customStrengthCCToggleControl;
NSString* customStrengthOpenControlCenterControl;
NSString* customStrengthCCModuleControl;

// Hardware Buttons Section (Custom)
NSString* customStrengthVolumeControl;
NSString* customStrengthSleepButtonControl;
NSString* customStrengthRingerControl;

// Homescreen Section (Custom)
NSString* customStrengthForceTouchControl;
NSString* customStrengthFolderOpenControl;
NSString* customStrengthFolderCloseControl;
NSString* customStrengthIconTapControl;
NSString* customStrengthPageSwipeControl;
NSString* customStrengthSpotlightControl;

// Lockscreen Section (Custom)
NSString* customStrengthPasscodeControl;
NSString* customStrengthQuickActionsButtonControl;

// Other Hardware Action Section (Custom)
NSString* customStrengthWakeControl;
NSString* customStrengthPluggedControl;
NSString* customStrengthConnectBluetoothDeviceControl;

// Status Changes Section (Custom)
NSString* customStrengthUnlockControl;
NSString* customStrengthLockControl;
NSString* customStrengthAuthenticationControl;
NSString* customStrengthCallControl;

// System Wide Section (Custom)
NSString* customStrengthUIButtonControl;
NSString* customStrengthUIButtonBarButtonControl;
NSString* customStrengthUITabBarButtonControl;
NSString* customStrengthUIImageViewControl;
NSString* customStrengthUIViewControl;
NSString* customStrengthUIWindowControl;

%group Homescreen

%hook SBUIIconForceTouchController

- (void)iconForceTouchViewControllerWillDismiss:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !forceSwitch) return;
	int customStrength = [customStrengthForceTouchControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBFolderController

- (void)folderControllerWillOpen:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !folderOpenSwitch) return;
	int customStrength = [customStrengthFolderOpenControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

- (void)folderControllerWillClose:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !folderCloseSwitch) return;
	int customStrength = [customStrengthFolderCloseControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBHIconManager

- (void)iconTapped:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !iconTapSwitch) return;
	int customStrength = [customStrengthIconTapControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBFolderView

- (void)scrollViewWillBeginDragging:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !pageSwipeSwitch) return;
	int customStrength = [customStrengthPageSwipeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBSearchScrollView

- (BOOL)gestureRecognizerShouldBegin:(id)arg1 {

	if (!enabled || !homescreenSectionSupportSwitch || !spotlightSwitch) return %orig;
	int customStrength = [customStrengthSpotlightControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	return %orig;

}

%end

%end

%group Lockscreen

%hook SBUIPasscodeLockViewBase 

- (void)_sendDelegateKeypadKeyDown {

	%orig;

	if (!enabled || !lockscreenSectionSupportSwitch || !passcodeSwitch) return;
	int customStrength = [customStrengthPasscodeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook CSQuickActionsButton

- (void)setSelected:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !alertDisappearSwitch) return;
	int customStrength = [customStrengthQuickActionsButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group Anywhere

%hook SBApplication

- (void)_didExitWithContext:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !killingSwitch) return;
	int customStrength = [customStrengthKillingControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBAppSwitcherPageView

- (void)setVisible:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !switcherSwitch) return;
	int customStrength = [customStrengthSwitcherControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SiriUISiriStatusView

- (void)didMoveToWindow {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !siriSwitch) return;
	int customStrength = [customStrengthSiriControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SSScreenCapturer

+ (void)playScreenshotSound {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !screenshotSwitch) return;
	int customStrength = [customStrengthScreenshotControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBUIController

- (void)handleWillBeginReachabilityAnimation {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !reachabilitySwitch) return;
	int customStrength = [customStrengthReachabilityControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UICalloutBar

- (void)buttonPressed:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !textSelectionSwitch) return;
	int customStrength = [customStrengthTextSelectionControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBPowerDownViewController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !powerSwitch) return;
	int customStrength = [customStrengthPowerDownControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !respringSwitch) return;
	int customStrength = [customStrengthRespringControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UIKeyboardLayoutStar

- (void)playKeyClickSoundOnDownForKey:(UIKBTree *)key {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !keyboardSwitch) return;
	int customStrength = [customStrengthKeyboardControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBIconController

- (void)viewWillAppear:(BOOL)arg1 {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !enterBackgroundSwitch) return;
	int customStrength = [customStrengthEnterBackgroundControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UIAlertController

- (void)viewWillAppear:(BOOL)arg1 {

    %orig;
	
	if (!enabled || !anywhereSectionSupportSwitch || !alertAppearSwitch) return;
	int customStrength = [customStrengthAlertAppearControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

- (void)viewWillDisappear:(BOOL)arg1 {

   %orig;
	
	if (!enabled || !anywhereSectionSupportSwitch || !alertDisappearSwitch) return;
	int customStrength = [customStrengthAlertDisappearControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group HardwareButtons

%hook SBVolumeControl

- (void)increaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

- (void)decreaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (BOOL)consumeInitialPressDown {

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !sleepButtonSwitch) return %orig;
	int customStrength = [customStrengthSleepButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	return %orig;

}

%end

%hook SpringBoard

- (void)_ringerChanged:(id)arg1 {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !ringerSwitch) return;
	int customStrength = [customStrengthRingerControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group ControlCenter

%hook CCUILabeledRoundButton

- (void)buttonTapped:(id)arg1 {

	%orig;

	if (!enabled || !controlCenterSectionSupportSwitch || !ccToggleSwitch) return;
	int customStrength = [customStrengthCCToggleControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBControlCenterController

- (void)_willPresent {

	%orig;

	if (!enabled || !controlCenterSectionSupportSwitch || !openControlCenterSwitch) return;
	int customStrength = [customStrengthOpenControlCenterControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook CCUIButtonModuleView

- (void)setHighlighted:(BOOL)arg1 {

	%orig;

	if (!enabled || !controlCenterSectionSupportSwitch || !ccModuleSwitch) return;
	int customStrength = [customStrengthCCModuleControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group StatusChanges

%hook SBCoverSheetPrimarySlidingViewController

- (void)viewWillDisappear:(BOOL)arg1 {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !unlockSwitch) return;
	int customStrength = [customStrengthUnlockControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBSleepWakeHardwareButtonInteraction

- (void)_playLockSound {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !lockSwitch) return;
	int customStrength = [customStrengthLockControl intValue];

	if (lockAnimationSwitch && !(LowPowerModeSwitch && LowPowerMode)) {
		gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		[gen impactOccurred];
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.065 * NSEC_PER_SEC);
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
					
			[gen impactOccurred];

		});
	} else if (customStrength == 0 && !enableLegacyEngineSwitch) {
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	} else if (customStrength != 0 && !enableLegacyEngineSwitch) {
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	} else if (customStrength == 0 && enableLegacyEngineSwitch) {
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];
	}

}

%end

%hook SBDashBoardLockScreenEnvironment

- (void)setAuthenticated:(BOOL)arg1 {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !authenticationSwitch) return;
	if (arg1) {
		int customStrength = [customStrengthAuthenticationControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch)
			[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
		else if (customStrength != 0 && !enableLegacyEngineSwitch)
			[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
		else if (customStrength == 0 && enableLegacyEngineSwitch)
			[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	}

}

%end

%hook TUCall

- (void)_handleStatusChange {

	%orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !callSwitch) return;
	int customStrength = [customStrengthCallControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook BluetoothDevice

- (void)connect {

	%orig;
	
	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !connectBluetoothDeviceSwitch) return;
	int customStrength = [customStrengthConnectBluetoothDeviceControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group OtherHardwareActions

%hook SBBacklightController

- (void)turnOnScreenFullyWithBacklightSource:(long long)source {

	%orig;

	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !wakeSwitch) return;

	if (source != 26) {
		int customStrength = [customStrengthWakeControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch)
			[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
		else if (customStrength != 0 && !enableLegacyEngineSwitch)
			[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
		else if (customStrength == 0 && enableLegacyEngineSwitch)
			[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	}

}

%end

%hook SBUIController

- (void)ACPowerChanged {

	%orig;

	if (!enabled || !otherHardwareActionsSectionSupportSwitch || !pluggedSwitch) return;
	int customStrength = [customStrengthPluggedControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group SystemWide

%hook UIButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIButtonSwitch) return;
	int customStrength = [customStrengthUIButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook _UIButtonBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIButtonBarButtonSwitch) return;
	int customStrength = [customStrengthUIButtonBarButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UITabBarButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UITabBarButtonSwitch) return;
	int customStrength = [customStrengthUITabBarButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UIImageView

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIImageViewSwitch) return;
	int customStrength = [customStrengthUIImageViewControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UIView 

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIViewSwitch) return;
	int customStrength = [customStrengthUIViewControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook UIWindow

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;
	
	if (!enabled || !systemWideSectionSupportSwitch || !UIWindowSwitch) return;
	int customStrength = [customStrengthUIWindowControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

// Getting The State Of The Low Power Mode And DND
%hook NSProcessInfo

- (BOOL)isLowPowerModeEnabled {

	LowPowerMode = %orig;

	return %orig;

}

%end

%hook DNDState

- (BOOL)isActive {

	isDNDActive = %orig;

	return %orig;

}

%end

%hook SBRingerControl

- (BOOL)isRingerMuted {

    isRingerSilent = %orig;

    return %orig;

}

%end

%group iOS12

%hook VolumeControl

- (void)increaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

- (void)decreaseVolume {

	%orig;

	if (!enabled || !hardwareButtonsSectionSupportSwitch || !volumeSwitch) return;
	int customStrength = [customStrengthVolumeControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBPowerDownController

- (void)orderFront {

	%orig;

	if (!enabled || !anywhereSectionSupportSwitch || !powerSwitch) return;
	int customStrength = [customStrengthPowerDownControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBIconController

- (void)iconTapped:(id)arg1 {

	%orig;

	if (!enabled || !homescreenSectionSupportSwitch || !iconTapSwitch) return;
	int customStrength = [customStrengthIconTapControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SBDashBoardViewController

- (void)setAuthenticated:(BOOL)authenticated {

    %orig;

	if (!enabled || !statusChangesSectionSupportSwitch || !authenticationSwitch) return;
    if (authenticated) {
		int customStrength = [customStrengthAuthenticationControl intValue];

		if (customStrength == 0 && !enableLegacyEngineSwitch)
			[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
		else if (customStrength != 0 && !enableLegacyEngineSwitch)
			[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
		else if (customStrength == 0 && enableLegacyEngineSwitch)
			[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

	}

}

%end

%hook SBDashBoardQuickActionsButton

- (void)setSelected:(BOOL)arg1 {

	%orig;

	if (!enabled || !lockscreenSectionSupportSwitch || !quickActionsButtonSwitch) return;
	int customStrength = [customStrengthQuickActionsButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%group RoseIntegrityFail

%hook SBIconController

- (void)viewDidAppear:(BOOL)animated {

    %orig;

    if (!dpkgInvalid) return;
		UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Rose"
		message:@"Seriously? Pirating a free Tweak is awful!\nPiracy repo's Tweaks could contain Malware if you didn't know that, so go ahead and get Rose from the official Source https://repo.litten.love/.\nIf you're seeing this but you got it from the official source then make sure to add https://repo.litten.love to Cydia or Sileo."
		preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Aww man" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {

			UIApplication *application = [UIApplication sharedApplication];
			[application openURL:[NSURL URLWithString:@"https://repo.litten.love/"] options:@{} completionHandler:nil];

	}];

		[alertController addAction:cancelAction];

		[self presentViewController:alertController animated:YES completion:nil];

}

%end

%end

%ctor {

	if (![NSProcessInfo processInfo]) return;
    NSString *processName = [NSProcessInfo processInfo].processName;
    bool isSpringboard = [@"SpringBoard" isEqualToString:processName];

    bool shouldLoad = NO;
    NSArray *args = [[NSClassFromString(@"NSProcessInfo") processInfo] arguments];
    NSUInteger count = args.count;
    if (count != 0) {
        NSString *executablePath = args[0];
        if (executablePath) {
            NSString *processName = [executablePath lastPathComponent];
            BOOL isApplication = [executablePath rangeOfString:@"/Application/"].location != NSNotFound || [executablePath rangeOfString:@"/Applications/"].location != NSNotFound;
            BOOL isFileProvider = [[processName lowercaseString] rangeOfString:@"fileprovider"].location != NSNotFound;
            BOOL skip = [processName isEqualToString:@"AdSheet"]
                        || [processName isEqualToString:@"CoreAuthUI"]
                        || [processName isEqualToString:@"InCallService"]
                        || [processName isEqualToString:@"MessagesNotificationViewService"]
                        || [executablePath rangeOfString:@".appex/"].location != NSNotFound;
            if ((!isFileProvider && isApplication && !skip) || isSpringboard) {
                shouldLoad = YES;
            }
        }
    }

    if (!shouldLoad) return;

    dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.rose.list"];

    if (!dpkgInvalid) dpkgInvalid = ![[NSFileManager defaultManager] fileExistsAtPath:@"/var/lib/dpkg/info/sh.litten.rose.md5sums"];

	if (dpkgInvalid) {
        %init(RoseIntegrityFail);
        return;

    }

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];

	// Enabled Switch
    [pfs registerBool:&enabled default:nil forKey:@"Enabled"];

	// Engine Switches
	[pfs registerBool:&enableTapticEngineSwitch default:NO forKey:@"enableTapticEngine"];
	[pfs registerBool:&enableHapticEngineSwitch default:NO forKey:@"enableHapticEngine"];
	[pfs registerBool:&enableLegacyEngineSwitch default:NO forKey:@"enableLegacyEngine"];

	// Segmented Controls For Feedback Strength
	[pfs registerObject:&tapticLevel default:@"0" forKey:@"TapticStrength"];
    [pfs registerObject:&hapticLevel default:@"0" forKey:@"HapticStrength"];
	[pfs registerObject:&legacyLevel default:@"0" forKey:@"LegacyStrength"];

	// Custom Legacy Sliders
	[pfs registerObject:&customlegacyDurationLevel default:@"0" forKey:@"customLegacyDuration"];
	[pfs registerObject:&customlegacyStrengthLevel default:@"0" forKey:@"customLegacyStrength"];

	// Switches To Enable Sections
	[pfs registerBool:&anywhereSectionSupportSwitch default:NO forKey:@"anywhereSectionSupport"];
	[pfs registerBool:&controlCenterSectionSupportSwitch default:NO forKey:@"controlCenterSectionSupport"];
	[pfs registerBool:&hardwareButtonsSectionSupportSwitch default:NO forKey:@"hardwareButtonsSectionSupport"];
	[pfs registerBool:&homescreenSectionSupportSwitch default:NO forKey:@"homescreenSectionSupport"];
	[pfs registerBool:&lockscreenSectionSupportSwitch default:NO forKey:@"lockscreenSectionSupport"];
	[pfs registerBool:&otherHardwareActionsSectionSupportSwitch default:NO forKey:@"otherHardwareActionsSectionSupport"];
	[pfs registerBool:&statusChangesSectionSupportSwitch default:NO forKey:@"statusChangesSectionSupport"];
	[pfs registerBool:&systemWideSectionSupportSwitch default:NO forKey:@"systemWideSectionSupport"];
	[pfs registerBool:&extrasSectionSupportSwitch default:NO forKey:@"extrasSectionSupport"];
	[pfs registerBool:&exceptionsSectionSupportSwitch default:NO forKey:@"exceptionsSectionSupport"];

	// Anywhere Section
	if (anywhereSectionSupportSwitch) {
		[pfs registerBool:&killingSwitch default:NO forKey:@"killingApp"];
		[pfs registerBool:&switcherSwitch default:NO forKey:@"appSwitcherFeedback"];
		[pfs registerBool:&siriSwitch default:NO forKey:@"siriUIFeedback"];
		[pfs registerBool:&screenshotSwitch default:NO forKey:@"takeScreenshot"];
		[pfs registerBool:&reachabilitySwitch default:NO forKey:@"reachability"];
		[pfs registerBool:&textSelectionSwitch default:NO forKey:@"textSelection"];
		[pfs registerBool:&powerSwitch default:NO forKey:@"powerDownView"];
		[pfs registerBool:&respringSwitch default:NO forKey:@"respring"];
		[pfs registerBool:&keyboardSwitch default:NO forKey:@"usingKeyboard"];
		[pfs registerBool:&enterBackgroundSwitch default:NO forKey:@"enterBackground"];
		[pfs registerBool:&alertAppearSwitch default:NO forKey:@"alertAppear"];
		[pfs registerBool:&alertDisappearSwitch default:NO forKey:@"alertDisappear"];
	}

	// Control Center Section
	if (controlCenterSectionSupportSwitch) {
		[pfs registerBool:&ccToggleSwitch default:NO forKey:@"controlCenterToggleFeedback"];
		[pfs registerBool:&openControlCenterSwitch default:NO forKey:@"openControlCenter"];
		[pfs registerBool:&ccModuleSwitch default:NO forKey:@"ccModule"];
	}

	// Hardware Buttons Section
	if (hardwareButtonsSectionSupportSwitch) {
		[pfs registerBool:&volumeSwitch default:NO forKey:@"volumeChanged"];
		[pfs registerBool:&sleepButtonSwitch default:NO forKey:@"sleepButton"];
		[pfs registerBool:&ringerSwitch default:NO forKey:@"ringer"];
	}

	// Homescreen Section
	if (homescreenSectionSupportSwitch) {
		[pfs registerBool:&forceSwitch default:NO forKey:@"forceTouchDismiss"];
		[pfs registerBool:&folderOpenSwitch default:NO forKey:@"folderOpen"];
		[pfs registerBool:&folderCloseSwitch default:NO forKey:@"folderClose"];
		[pfs registerBool:&iconTapSwitch default:NO forKey:@"iconTap"];
		[pfs registerBool:&pageSwipeSwitch default:NO forKey:@"pageSwipe"];
		[pfs registerBool:&spotlightSwitch default:NO forKey:@"spotlight"];
	}

	// Lockscreen Section
	if (lockscreenSectionSupportSwitch) {
		[pfs registerBool:&passcodeSwitch default:NO forKey:@"enterPasscode"];
		[pfs registerBool:&quickActionsButtonSwitch default:NO forKey:@"quickActionsButton"];
	}

	// Other Hardware Actions Section
	if (otherHardwareActionsSectionSupportSwitch) {
		[pfs registerBool:&wakeSwitch default:NO forKey:@"displayWake"];
		[pfs registerBool:&pluggedSwitch default:NO forKey:@"chargerPluggedInOrOut"];
		[pfs registerBool:&connectBluetoothDeviceSwitch default:NO forKey:@"connectBluetoothDevice"];
	}

	// Status Changes Section
	if (statusChangesSectionSupportSwitch) {
		[pfs registerBool:&unlockSwitch default:NO forKey:@"unlock"];
		[pfs registerBool:&lockSwitch default:NO forKey:@"lock"];
		[pfs registerBool:&authenticationSwitch default:NO forKey:@"authentication"];
		[pfs registerBool:&callSwitch default:NO forKey:@"call"];
	}

	// System Wide Section
	if (systemWideSectionSupportSwitch) {
		[pfs registerBool:&UIButtonSwitch default:NO forKey:@"UIButton"];
		[pfs registerBool:&UIButtonBarButtonSwitch default:NO forKey:@"UIButtonBarButton"];
		[pfs registerBool:&UITabBarButtonSwitch default:NO forKey:@"UITabBarButton"];
		[pfs registerBool:&UIImageViewSwitch default:NO forKey:@"UIImageView"];
		[pfs registerBool:&UIViewSwitch default:NO forKey:@"UIView"];
		[pfs registerBool:&UIWindowSwitch default:NO forKey:@"UIWindow"];
	}

	// Additionals Section
	if (extrasSectionSupportSwitch) {
		[pfs registerBool:&lockAnimationSwitch default:NO forKey:@"lockAnimation"];
	}

	// App Support Switches
	[pfs registerBool:&apolloSupportSwitch default:NO forKey:@"apolloSupport"];
	[pfs registerBool:&calculatorSupportSwitch default:NO forKey:@"calculatorSupport"];
	[pfs registerBool:&facebookSupportSwitch default:NO forKey:@"facebookSupport"];
	[pfs registerBool:&instagramSupportSwitch default:NO forKey:@"instagramSupport"];
	[pfs registerBool:&musicSupportSwitch default:NO forKey:@"musicSupport"];
	[pfs registerBool:&phoneSupportSwitch default:NO forKey:@"phoneSupport"];
	[pfs registerBool:&safariSupportSwitch default:NO forKey:@"safariSupport"];
	[pfs registerBool:&sileoSupportSwitch default:NO forKey:@"sileoSupport"];
	[pfs registerBool:&spotifySupportSwitch default:NO forKey:@"spotifySupport"];
	[pfs registerBool:&tiktokSupportSwitch default:NO forKey:@"tiktokSupport"];
	[pfs registerBool:&twitterSupportSwitch default:NO forKey:@"twitterSupport"];

	// Delay Slider And Switch
	[pfs registerBool:&delaySwitch default:NO forKey:@"enableHapticDelay"];
	[pfs registerObject:&delayLevel default:@"0.0" forKey:@"Delay"];

	// Low Power, DND Mode And Ringer Detection
	if (exceptionsSectionSupportSwitch) {
		[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"lowPowerMode"];
		[pfs registerBool:&isDNDActiveSwitch default:NO forKey:@"isDNDActive"];
		[pfs registerBool:&isRingerSilentSwitch default:NO forKey:@"isRingerSilent"];
	}

	// Anywhere List Controllers
	if (anywhereSectionSupportSwitch) {
		[pfs registerObject:&customStrengthKillingControl default:@"0" forKey:@"customStrengthKilling"];
		[pfs registerObject:&customStrengthSwitcherControl default:@"0" forKey:@"customStrengthSwitcher"];
		[pfs registerObject:&customStrengthSiriControl default:@"0" forKey:@"customStrengthSiri"];
		[pfs registerObject:&customStrengthScreenshotControl default:@"0" forKey:@"customStrengthScreenshot"];
		[pfs registerObject:&customStrengthReachabilityControl default:@"0" forKey:@"customStrengthReachability"];
		[pfs registerObject:&customStrengthTextSelectionControl default:@"0" forKey:@"customStrengthTextSelection"];
		[pfs registerObject:&customStrengthPowerDownControl default:@"0" forKey:@"customStrengthPowerDown"];
		[pfs registerObject:&customStrengthRespringControl default:@"0" forKey:@"customStrengthRespring"];
		[pfs registerObject:&customStrengthKeyboardControl default:@"0" forKey:@"customStrengthKeyboard"];
		[pfs registerObject:&customStrengthEnterBackgroundControl default:@"0" forKey:@"customStrengthEnterBackground"];
		[pfs registerObject:&customStrengthAlertAppearControl default:@"0" forKey:@"customStrengthAlertAppear"];
		[pfs registerObject:&customStrengthAlertDisappearControl default:@"0" forKey:@"customStrengthAlertDisappear"];
	}

	// Control Center Section
	if (controlCenterSectionSupportSwitch) {
		[pfs registerObject:&customStrengthCCToggleControl default:@"0" forKey:@"customStrengthCCToggle"];
		[pfs registerObject:&customStrengthOpenControlCenterControl default:@"0" forKey:@"customStrengthOpenControlCenter"];
		[pfs registerObject:&customStrengthCCModuleControl default:@"0" forKey:@"customStrengthCCModule"];
	}

	// Hardware Buttons Section
	if (hardwareButtonsSectionSupportSwitch) {
		[pfs registerObject:&customStrengthVolumeControl default:@"0" forKey:@"customStrengthVolume"];
		[pfs registerObject:&customStrengthSleepButtonControl default:@"0" forKey:@"customStrengthSleepButton"];
		[pfs registerObject:&customStrengthRingerControl default:@"0" forKey:@"customStrengthRinger"];
	}

	// Homescreen Section
	if (homescreenSectionSupportSwitch) {
		[pfs registerObject:&customStrengthForceTouchControl default:@"0" forKey:@"customStrengthForceTouch"];
		[pfs registerObject:&customStrengthFolderOpenControl default:@"0" forKey:@"customStrengthFolderOpen"];
		[pfs registerObject:&customStrengthFolderCloseControl default:@"0" forKey:@"customStrengthFolderClose"];
		[pfs registerObject:&customStrengthIconTapControl default:@"0" forKey:@"customStrengthIconTap"];
		[pfs registerObject:&customStrengthPageSwipeControl default:@"0" forKey:@"customStrengthPageSwipe"];
		[pfs registerObject:&customStrengthSpotlightControl default:@"0" forKey:@"customStrengthSpotlight"];
	}

	// Lockscreen Section
	if (lockscreenSectionSupportSwitch) {
		[pfs registerObject:&customStrengthPasscodeControl default:@"0" forKey:@"customStrengthPasscode"];
		[pfs registerObject:&customStrengthQuickActionsButtonControl default:@"0" forKey:@"customStrengthQuickActionsButton"];
	}

	// Other Hardware Actions Section
	if (otherHardwareActionsSectionSupportSwitch) {
		[pfs registerObject:&customStrengthWakeControl default:@"0" forKey:@"customStrengthWake"];
		[pfs registerObject:&customStrengthPluggedControl default:@"0" forKey:@"customStrengthPlugged"];
		[pfs registerObject:&customStrengthConnectBluetoothDeviceControl default:@"0" forKey:@"customStrengthConnectBluetoothDevice"];
	}

	// Status Changes Section
	if (statusChangesSectionSupportSwitch) {
		[pfs registerObject:&customStrengthUnlockControl default:@"0" forKey:@"customStrengthUnlock"];
		[pfs registerObject:&customStrengthLockControl default:@"0" forKey:@"customStrengthLock"];
		[pfs registerObject:&customStrengthAuthenticationControl default:@"0" forKey:@"customStrengthAuthentication"];
		[pfs registerObject:&customStrengthCallControl default:@"0" forKey:@"customStrengthCall"];
	}

	// System Wide Section
	if (systemWideSectionSupportSwitch) {
		[pfs registerObject:&customStrengthUIButtonControl default:@"0" forKey:@"customStrengthUIButton"];
		[pfs registerObject:&customStrengthUIButtonBarButtonControl default:@"0" forKey:@"customStrengthUIButtonBarButton"];
		[pfs registerObject:&customStrengthUITabBarButtonControl default:@"0" forKey:@"customStrengthUITabBarButton"];
		[pfs registerObject:&customStrengthUIImageViewControl default:@"0" forKey:@"customStrengthUIImageView"];
		[pfs registerObject:&customStrengthUIViewControl default:@"0" forKey:@"customStrengthUIView"];
		[pfs registerObject:&customStrengthUIWindowControl default:@"0" forKey:@"customStrengthUIWindow"];
	}

	if (!dpkgInvalid && enabled) {
        BOOL ok = false;
        
        ok = ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithFormat:@"/var/lib/dpkg/info/%@%@%@%@%@%@%@%@%@.rose.md5sums", @"s", @"h", @".", @"l", @"i", @"t", @"t", @"e", @"n"]]
        );

        if (ok && [@"litten" isEqualToString:@"litten"]) {
			haptics = [[roseCall alloc] init];
			tapticLVL = [tapticLevel intValue];
			hapticLVL = [hapticLevel intValue];
			delayLVL = [delayLevel doubleValue];
			selectedLegacyMode = [legacyLevel intValue];
			customLegacyDuration = [customlegacyDurationLevel doubleValue];
			customLegacyStrength = [customlegacyStrengthLevel doubleValue];
			if (homescreenSectionSupportSwitch) %init(Homescreen);
			if (lockscreenSectionSupportSwitch) %init(Lockscreen);
			if (anywhereSectionSupportSwitch) %init(Anywhere);
			if (hardwareButtonsSectionSupportSwitch) %init(HardwareButtons);
			if (controlCenterSectionSupportSwitch) %init(ControlCenter);
			if (statusChangesSectionSupportSwitch) %init(StatusChanges);
			if (otherHardwareActionsSectionSupportSwitch) %init(OtherHardwareActions);
			if (systemWideSectionSupportSwitch)	 %init(SystemWide);
			%init(_ungrouped); // Initialise Everything Outside Any Group
			if (@available(iOS 12.0, *)) %init(iOS12);

			return;
        } else {
            dpkgInvalid = YES;
        }
    }

}