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

BOOL sileoSupportSwitch;

// Sileo
BOOL SileoSourcesCellSwitch;
BOOL SileoPackageCollectionViewCellSwitch;
BOOL SileoTableViewCellSwitch;
BOOL SileoFeaturedBannerViewSwitch;
BOOL SileoConfirmDownloadButtonSwitch;
BOOL SileoGetButtonSwitch;

// Sileo (Custom)
NSString* customStrengthSileoSourcesCellControl;
NSString* customStrengthSileoPackageCollectionViewCellControl;
NSString* customStrengthSileoTableViewCellControl;
NSString* customStrengthSileoFeaturedBannerViewControl;
NSString* customStrengthSileoConfirmDownloadButtonControl;
NSString* customStrengthSileoGetButtonControl;

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

%group Sileo

%hook SileoSourcesCell // Sources Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoSourcesCellSwitch) return;
	int customStrength = [customStrengthSileoSourcesCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SileoPackageCollectionViewCell // Package Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoPackageCollectionViewCellSwitch) return;
	int customStrength = [customStrengthSileoPackageCollectionViewCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SileoTableViewCell // Table View Cell

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoTableViewCellSwitch) return;
	int customStrength = [customStrengthSileoTableViewCellControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SileoFeaturedBannerView // Featured Banner View

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoFeaturedBannerViewSwitch) return;
	int customStrength = [customStrengthSileoFeaturedBannerViewControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook SileoConfirmDownloadButton // Download Confirm / ReSpring Button

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoConfirmDownloadButtonSwitch) return;
	int customStrength = [customStrengthSileoConfirmDownloadButtonControl intValue];

	if (customStrength == 0 && !enableLegacyEngineSwitch)
		[haptics triggerFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];
	else if (customStrength != 0 && !enableLegacyEngineSwitch)
		[haptics triggerCustomFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customStrength];
	else if (customStrength == 0 && enableLegacyEngineSwitch)
		[haptics triggerLegacyFeedback:LowPowerModeSwitch :LowPowerMode :isDNDActiveSwitch :isDNDActive :isRingerSilentSwitch :isRingerSilent :delaySwitch :delayLVL :enabled :enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :customLegacyDuration :customLegacyStrength :selectedLegacyMode];

}

%end

%hook PackageQueueButton

- (void)touchesBegan:(id)arg1 withEvent:(id)arg2 {

	%orig;

	if (!enabled || !sileoSupportSwitch || !SileoGetButtonSwitch) return;
	int customStrength = [customStrengthSileoGetButtonControl intValue];

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
	[pfs registerBool:&sileoSupportSwitch default:NO forKey:@"sileoSupport"];

	// Low Power, DND Mode And Ringer Detection
	if (exceptionsSectionSupportSwitch) {
		[pfs registerBool:&LowPowerModeSwitch default:NO forKey:@"lowPowerMode"];
		[pfs registerBool:&isDNDActiveSwitch default:NO forKey:@"isDNDActive"];
		[pfs registerBool:&isRingerSilentSwitch default:NO forKey:@"isRingerSilent"];
	}

	if (sileoSupportSwitch) {
		[pfs registerBool:&SileoSourcesCellSwitch default:NO forKey:@"SileoSourcesCell"];
		[pfs registerBool:&SileoPackageCollectionViewCellSwitch default:NO forKey:@"SileoPackageCollectionViewCell"];
		[pfs registerBool:&SileoTableViewCellSwitch default:NO forKey:@"SileoTableViewCell"];
		[pfs registerBool:&SileoFeaturedBannerViewSwitch default:NO forKey:@"SileoFeaturedBannerView"];
		[pfs registerBool:&SileoConfirmDownloadButtonSwitch default:NO forKey:@"SileoConfirmDownloadButton"];
		[pfs registerBool:&SileoGetButtonSwitch default:NO forKey:@"SileoGetButton"];
	}

	if (sileoSupportSwitch) {
		[pfs registerObject:&customStrengthSileoSourcesCellControl default:@"0" forKey:@"customStrengthSileoSourcesCell"];
		[pfs registerObject:&customStrengthSileoPackageCollectionViewCellControl default:@"0" forKey:@"customStrengthSileoPackageCollectionViewCell"];
		[pfs registerObject:&customStrengthSileoTableViewCellControl default:@"0" forKey:@"customStrengthSileoTableViewCell"];
		[pfs registerObject:&customStrengthSileoFeaturedBannerViewControl default:@"0" forKey:@"customStrengthSileoFeaturedBannerView"];
		[pfs registerObject:&customStrengthSileoConfirmDownloadButtonControl default:@"0" forKey:@"customStrengthSileoConfirmDownloadButton"];
		[pfs registerObject:&customStrengthSileoGetButtonControl default:@"0" forKey:@"customStrengthSileoGetButton"];
	}

    if (!dpkgInvalid && enabled) {
        if (sileoSupportSwitch) {
			haptics = [[roseCall alloc] init];
			tapticLVL = [tapticLevel intValue];
			hapticLVL = [hapticLevel intValue];
			delayLVL = [delayLevel doubleValue];
			selectedLegacyMode = [legacyLevel intValue];
			customLegacyDuration = [customlegacyDurationLevel doubleValue];
			customLegacyStrength = [customlegacyStrengthLevel doubleValue];
			%init(Sileo, SileoSourcesCell=objc_getClass("Sileo.SourcesTableViewCell"), SileoPackageCollectionViewCell=objc_getClass("Sileo.PackageCollectionViewCell"), SileoTableViewCell=objc_getClass("Sileo.SileoTableViewCell"), SileoFeaturedBannerView=objc_getClass("Sileo.FeaturedBannerView"), SileoConfirmDownloadButton=objc_getClass("Sileo.DownloadConfirmButton"));
		}

		return;
    }

}