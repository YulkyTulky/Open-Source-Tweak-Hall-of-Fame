#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioServices.h>
#import <Cephei/HBPreferences.h>

// Used To Detect What iOS Version Is Being Used
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

// Utils
HBPreferences *pfs;

// Thanks to Nepeta for the DRM
BOOL dpkgInvalid;

// Option Switches
extern BOOL enabled;
extern BOOL enableTapticEngineSwitch;
extern BOOL enableHapticEngineSwitch;
extern BOOL enableLegacyEngineSwitch;

// Feedback Strength Segmented Controls, Custom Legacy Settings And Delay Slider
extern NSString* tapticLevel;
extern NSString* hapticLevel;
extern NSString* legacyLevel;
extern NSString* customlegacyDurationLevel;
extern NSString* customlegacyStrengthLevel;

// Switches To Enable Sections
extern BOOL anywhereSectionSupportSwitch;
extern BOOL controlCenterSectionSupportSwitch;
extern BOOL hardwareButtonsSectionSupportSwitch;
extern BOOL homescreenSectionSupportSwitch;
extern BOOL lockscreenSectionSupportSwitch;
extern BOOL otherHardwareActionsSectionSupportSwitch;
extern BOOL statusChangesSectionSupportSwitch;
extern BOOL systemWideSectionSupportSwitch;
extern BOOL extrasSectionSupportSwitch;
extern BOOL exceptionsSectionSupportSwitch;

// Anywhere Section
extern BOOL killingSwitch;
extern BOOL switcherSwitch;
extern BOOL siriSwitch;
extern BOOL screenshotSwitch;
extern BOOL reachabilitySwitch;
extern BOOL textSelectionSwitch;
extern BOOL powerSwitch;
extern BOOL respringSwitch;
extern BOOL keyboardSwitch;
extern BOOL enterBackgroundSwitch;
extern BOOL alertAppearSwitch;
extern BOOL alertDisappearSwitch;

// Control Center Section
extern BOOL ccToggleSwitch;
extern BOOL openControlCenterSwitch;
extern BOOL ccModuleSwitch;

// Hardware Buttons
extern BOOL volumeSwitch;
extern BOOL sleepButtonSwitch;
extern BOOL ringerSwitch;

// Homescreen Section
extern BOOL forceSwitch;
extern BOOL folderOpenSwitch;
extern BOOL folderCloseSwitch;
extern BOOL iconTapSwitch;
extern BOOL pageSwipeSwitch;
extern BOOL spotlightSwitch;

// Lockscreen Section
extern BOOL passcodeSwitch;
extern BOOL quickActionsButtonSwitch;

// Other Hardware Actions Section
extern BOOL wakeSwitch;
extern BOOL pluggedSwitch;
extern BOOL connectBluetoothDeviceSwitch;

// Status Changes Section
extern BOOL unlockSwitch;
extern BOOL lockSwitch;
extern BOOL authenticationSwitch;
extern BOOL callSwitch;

// System Wide Section
extern BOOL UIButtonSwitch;
extern BOOL UIButtonBarButtonSwitch;
extern BOOL UITabBarButtonSwitch;
extern BOOL UIImageViewSwitch;
extern BOOL UIViewSwitch;
extern BOOL UIWindowSwitch;

// Additionals Section
extern BOOL lockAnimationSwitch;

// Enable App Support Switches
extern BOOL apolloSupportSwitch;
extern BOOL calculatorSupportSwitch;
extern BOOL facebookSupportSwitch;
extern BOOL instagramSupportSwitch;
extern BOOL musicSupportSwitch;
extern BOOL phoneSupportSwitch;
extern BOOL safariSupportSwitch;
extern BOOL sileoSupportSwitch;
extern BOOL spotifySupportSwitch;
extern BOOL tiktokSupportSwitch;
extern BOOL twitterSupportSwitch;

// Spotify
extern BOOL SPTplayButtonSwitch;
extern BOOL SPTplayBarButtonSwitch;
extern BOOL SPTpreviousTrackButtonSwitch;
extern BOOL SPTnextTrackButtonSwitch;
extern BOOL SPTrepeatButtonSwitch;
extern BOOL SPTshuffleButtonSwitch;
extern BOOL SPTqueueButtonSwitch;
extern BOOL SPTsliderSwitch;
extern BOOL SPTfreeTierButtonSwitch;
extern BOOL SPTavailableDevicesButtonSwitch;
extern BOOL SPTnowPlayingLabelSwitch;
extern BOOL SPTplaylistButtonsSwitch;

// Instagram
extern BOOL ITGlikeButtonSwitch;
extern BOOL ITGdoubleTapToLikeSwitch;
extern BOOL ITGcommentButtonSwitch;
extern BOOL ITGsaveButtonSwitch;
extern BOOL ITGsendButtonSwitch;

// Music (Custom)
extern BOOL MusicPlayPauseButtonsSwitch;
extern BOOL MusicVolumeSliderSwitch;
extern BOOL MusicContextualActionsButtonSwitch;
extern BOOL MusicTimeSliderSwitch;
extern BOOL MusicSongCellSwitch;
extern BOOL MusicLibraryCellSwitch;
extern BOOL MusicAlbumCellSwitch;
extern BOOL MusicAirPlayButtonSwitch;
extern BOOL MusicLiveLyricsQueueButtonSwitch;

// TikTok
extern BOOL TTlikeCommentShareButtonsSwitch;

// Twitter
extern BOOL TWTtabBarSwitch;
extern BOOL TWTtweetViewSwitch;
extern BOOL TWTdirectMessagesTapSwitch;
extern BOOL TWTactivityTapSwitch;
extern BOOL TWTtweetButtonSwitch;

// Safari
extern BOOL SFUrlSwitch;

// Phone
extern BOOL PHNumberPadSwitch;
extern BOOL PHContactCellSwitch;
extern BOOL PHDialerDeleteButtonSwitch;
extern BOOL PHDialerCallButtonSwitch;

// Facebook
extern BOOL FBTabBarSwitch;
extern BOOL FBQuickAccessButtonsSwitch;
extern BOOL FBNavigationBarButtonSwitch;

// Calculator
extern BOOL CalculatorKeyPadButtonSwitch;

// Sileo
extern BOOL SileoSourcesCellSwitch;
extern BOOL SileoPackageCollectionViewCellSwitch;
extern BOOL SileoTableViewCellSwitch;
extern BOOL SileoFeaturedBannerViewSwitch;
extern BOOL SileoConfirmDownloadButtonSwitch;
extern BOOL SileoGetButtonSwitch;

// Apollo
extern BOOL apolloJumpBarSwitch;
extern BOOL apolloFloatingActionButtonSwitch;
extern BOOL apolloASDisplayViewSwitch;
extern BOOL apolloUIButtonSwitch;

// Delay
extern BOOL delaySwitch;
extern NSString* delayLevel;

// Low Power Mode And DND Mode Recognition
extern BOOL LowPowerMode;
extern BOOL LowPowerModeSwitch;
extern BOOL isDNDActive;
extern BOOL isDNDActiveSwitch;
extern BOOL isRingerSilent;
extern BOOL isRingerSilentSwitch;

// Anywhere Section (Custom)
extern NSString* customStrengthKillingControl;
extern NSString* customStrengthSwitcherControl;
extern NSString* customStrengthSiriControl;
extern NSString* customStrengthScreenshotControl;
extern NSString* customStrengthReachabilityControl;
extern NSString* customStrengthTextSelectionControl;
extern NSString* customStrengthPowerDownControl;
extern NSString* customStrengthRespringControl;
extern NSString* customStrengthKeyboardControl;
extern NSString* customStrengthEnterBackgroundControl;
extern NSString* customStrengthAlertAppearControl;
extern NSString* customStrengthAlertDisappearControl;

// Control Center Section (Custom)
extern NSString* customStrengthCCToggleControl;
extern NSString* customStrengthOpenControlCenterControl;
extern NSString* customStrengthCCModuleControl;

// Hardware Buttons Section (Custom)
extern NSString* customStrengthVolumeControl;
extern NSString* customStrengthSleepButtonControl;
extern NSString* customStrengthRingerControl;

// Homescreen Section (Custom)
extern NSString* customStrengthForceTouchControl;
extern NSString* customStrengthFolderOpenControl;
extern NSString* customStrengthFolderCloseControl;
extern NSString* customStrengthIconTapControl;
extern NSString* customStrengthPageSwipeControl;
extern NSString* customStrengthSpotlightControl;

// Lockscreen Section (Custom)
extern NSString* customStrengthPasscodeControl;
extern NSString* customStrengthQuickActionsButtonControl;

// Other Hardware Action Section (Custom)
extern NSString* customStrengthWakeControl;
extern NSString* customStrengthPluggedControl;
extern NSString* customStrengthConnectBluetoothDeviceControl;

// Status Changes Section (Custom)
extern NSString* customStrengthUnlockControl;
extern NSString* customStrengthLockControl;
extern NSString* customStrengthAuthenticationControl;
extern NSString* customStrengthCallControl;

// System Wide Section (Custom)
extern NSString* customStrengthUIButtonControl;
extern NSString* customStrengthUIButtonBarButtonControl;
extern NSString* customStrengthUITabBarButtonControl;
extern NSString* customStrengthUIImageViewControl;
extern NSString* customStrengthUIViewControl;
extern NSString* customStrengthUIWindowControl;

// Spotify (Custom)
extern NSString* customStrengthSPTplayButtonControl;
extern NSString* customStrengthSPTplayBarButtonControl;
extern NSString* customStrengthSPTpreviousTrackButtonControl;
extern NSString* customStrengthSPTnextTrackButtonControl;
extern NSString* customStrengthSPTrepeatButtonControl;
extern NSString* customStrengthSPTshuffleButtonControl;
extern NSString* customStrengthSPTqueueButtonControl;
extern NSString* customStrengthSPTsliderControl;
extern NSString* customStrengthSPTfreeTierButtonControl;
extern NSString* customStrengthSPTavailableDevicesButtonControl;
extern NSString* customStrengthSPTnowPlayingLabelControl;
extern NSString* customStrengthSPTplaylistButtonsControl;

// Instagram (Custom)
extern NSString* customStrengthITGlikeButtonControl;
extern NSString* customStrengthITGdoubleTapToLikeControl;
extern NSString* customStrengthITGcommentButtonControl;
extern NSString* customStrengthITGsaveButtonControl;
extern NSString* customStrengthITGsendButtonControl;

// Music (Custom)
extern NSString *customStrengthMusicApplicationPlayButtonControl;
extern NSString *customStrengthMusicApplicationVolumeSliderControl;
extern NSString *customStrengthMusicApplicationContextualActionsButtonControl;
extern NSString *customStrengthMusicApplicationTimeSliderControl;
extern NSString *customStrengthMusicApplicationSongCellControl;
extern NSString *customStrengthLibraryCellControl;
extern NSString *customStrengthMusicApplicationAlbumCellControl;
extern NSString *customStrengthMPRouteButtonControl;
extern NSString *customStrengthMPButtonControl;

// TikTok (Custom)
extern NSString* customStrengthTTlikeCommentShareButtonsControl;

// Twitter (Custom)
extern NSString* customStrengthTWTtabBarControl;
extern NSString* customStrengthTWTtweetViewControl;
extern NSString* customStrengthTWTdirectMessagesTapControl;
extern NSString* customStrengthTWTactivityTapControl;
extern NSString* customStrengthTWTtweetButtonControl;

// Safari (Custom)
extern NSString* customStrengthSFUrlControl;

// Phone (Custom)
extern NSString* customStrengthPHNumberPadControl;
extern NSString* customStrengthPHContactCellControl;
extern NSString* customStrengthPHDialerDeleteButtonControl;
extern NSString* customStrengthPHDialerCallButtonControl;

// Facebook (Custom)
extern NSString* customStrengthFBTabBarControl;
extern NSString* customStrengthFBQuickAccessButtonsControl;
extern NSString* customStrengthFBNavigationBarButtonControl;

// Calculator (Custom)
extern NSString* customStrengthCalculatorApplicationKeyPadButtonControl;

// Sileo (Custom)
extern NSString* customStrengthSileoSourcesCellControl;
extern NSString* customStrengthSileoPackageCollectionViewCellControl;
extern NSString* customStrengthSileoTableViewCellControl;
extern NSString* customStrengthSileoFeaturedBannerViewControl;
extern NSString* customStrengthSileoConfirmDownloadButtonControl;
extern NSString* customStrengthSileoGetButtonControl;

// Apollo (Custom)
extern NSString* customStrengthApolloJumpBarControl;
extern NSString* customStrengthApolloFloatingActionButtonControl;
extern NSString* customStrengthApolloASDisplayViewControl;
extern NSString* customStrengthApolloUIButtonControl;

// Needed Interfaces
@interface UIKBTree : NSObject
@end

@interface DNDState : NSObject
- (BOOL)isActive;
@end

@interface SBRingerControl : NSObject
- (BOOL)isRingerMuted;
@end

@interface SBIconController : UIViewController
- (void)viewDidAppear:(BOOL)animated;
@end

@interface SBCoverSheetPrimarySlidingViewController : UIViewController
- (void)viewDidDisappear:(BOOL)arg1;
- (void)viewDidAppear:(BOOL)arg1;
@end