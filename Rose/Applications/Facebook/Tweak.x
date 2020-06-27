#import "../../Tweak/Rose.h"
#import "Rose/librose.h"

roseCall* haptics;

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

BOOL exceptionsSectionSupportSwitch;

BOOL facebookSupportSwitch;

// Facebook
BOOL FBTabBarSwitch;
BOOL FBQuickAccessButtonsSwitch;
BOOL FBNavigationBarButtonSwitch;

// Facebook (Custom)
NSString* customStrengthFBTabBarControl;
NSString* customStrengthFBQuickAccessButtonsControl;
NSString* customStrengthFBNavigationBarButtonControl;

// Delay
BOOL delaySwitch;
NSString* delayLevel;

// Low Power Mode, DND Mode And Ringer Recognition
BOOL LowPowerMode;
BOOL LowPowerModeSwitch;
BOOL isDNDActive;
BOOL isDNDActiveSwitch;
BOOL isRingerSilent;
BOOL isRingerSilentSwitch;

%group Facebook

%hook FBTabBar

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !facebookSupportSwitch || !FBTabBarSwitch) return;
	int customStrength = [customStrengthFBTabBarControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook FDSTetraPressStateAnnouncingControl

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !facebookSupportSwitch || !FBQuickAccessButtonsSwitch) return;
	int customStrength = [customStrengthFBQuickAccessButtonsControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%end

%ctor {

    pfs = [[HBPreferences alloc] initWithIdentifier:@"sh.litten.rosepreferences"];

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

	[pfs registerBool:&exceptionsSectionSupportSwitch default:NO forKey:@"exceptionsSectionSupport"];
	[pfs registerBool:&facebookSupportSwitch default:NO forKey:@"facebookSupport"];

	// Low Power, DND Mode And Ringer Detection
	if (exceptionsSectionSupportSwitch) {
		[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"lowPowerMode"];
		[pfs registerBool:&isDNDActiveSwitch default:NO forKey:@"isDNDActive"];
		[pfs registerBool:&isRingerSilentSwitch default:NO forKey:@"isRingerSilent"];
	}

	if (facebookSupportSwitch) {
		[pfs registerBool:&FBTabBarSwitch default:NO forKey:@"FBTabBar"];
		[pfs registerBool:&FBQuickAccessButtonsSwitch default:NO forKey:@"QuickAccessButtons"];
		[pfs registerBool:&FBNavigationBarButtonSwitch default:NO forKey:@"FBNavigationBarButton"];
	}

	if (facebookSupportSwitch) {
		[pfs registerObject:&customStrengthFBTabBarControl default:@"0" forKey:@"customStrengthFBTabBar"];
		[pfs registerObject:&customStrengthFBQuickAccessButtonsControl default:@"0" forKey:@"customStrengthQuickAccessButtons"];
		[pfs registerObject:&customStrengthFBNavigationBarButtonControl default:@"0" forKey:@"customStrengthFBNavigationBarButton"];
	}

    if (!dpkgInvalid && enabled) {
        if (facebookSupportSwitch) {
			haptics = [[roseCall alloc] init];
			tapticLVL = [tapticLevel intValue];
			hapticLVL = [hapticLevel intValue];
			delayLVL = [delayLevel doubleValue];
			selectedLegacyMode = [legacyLevel intValue];
			customLegacyDuration = [customlegacyDurationLevel doubleValue];
			customLegacyStrength = [customlegacyStrengthLevel doubleValue];
			%init(Facebook);
		}

		return;
    }

}