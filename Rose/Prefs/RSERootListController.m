#include "RSERootListController.h"
#include <Cephei/HBRespringController.h>
#import "../Tweak/Rose.h"
#import <sys/utsname.h>
#import <spawn.h>
#import <Rose/librose.h>

roseCall* haptics;

BOOL enabled = NO;
BOOL enableTapticEngineSwitch;
BOOL enableHapticEngineSwitch;
BOOL enableLegacyEngineSwitch;

BOOL hasCompletedSetup = NO;
BOOL isTapticEngineDevice;
BOOL isHapticEngineDevice;
BOOL isOldEngineDevice;

UIViewController* controller;
UIViewController* controller2;
UIButton* continueButton;
UIActivityIndicatorView *loadingIndicator;
UITextView* textView;
NSString* logText = @"";

UIImpactFeedbackGenerator* gen;

@implementation RSERootListController

- (instancetype)init {

    self = [super init];

    if (self) {
        RSEAppearanceSettings *appearanceSettings = [[RSEAppearanceSettings alloc] init];
        self.hb_appearanceSettings = appearanceSettings;
        self.enableSwitch = [[UISwitch alloc] init];
        self.enableSwitch.onTintColor = [UIColor colorWithRed:1.00 green:0.96 blue:0.64 alpha:1.0];
        [self.enableSwitch addTarget:self action:@selector(toggleState) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* switchy = [[UIBarButtonItem alloc] initWithCustomView: self.enableSwitch];
        self.navigationItem.rightBarButtonItem = switchy;

        self.navigationItem.titleView = [UIView new];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.titleLabel.text = @"7.5.5";
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.navigationItem.titleView addSubview:self.titleLabel];

        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        self.iconView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RosePrefs.bundle/icon@2x.png"];
        self.iconView.translatesAutoresizingMaskIntoConstraints = NO;
        self.iconView.alpha = 0.0;
        [self.navigationItem.titleView addSubview:self.iconView];
        
        [NSLayoutConstraint activateConstraints:@[
            [self.titleLabel.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
            [self.iconView.topAnchor constraintEqualToAnchor:self.navigationItem.titleView.topAnchor],
            [self.iconView.leadingAnchor constraintEqualToAnchor:self.navigationItem.titleView.leadingAnchor],
            [self.iconView.trailingAnchor constraintEqualToAnchor:self.navigationItem.titleView.trailingAnchor],
            [self.iconView.bottomAnchor constraintEqualToAnchor:self.navigationItem.titleView.bottomAnchor],
        ]];
    }

    return self;

}

- (NSArray *)specifiers {

	if (_specifiers == nil) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
        
	}

	return _specifiers;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,200,200)];
    self.headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headerImageView.image = [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RosePrefs.bundle/Banner.png"];
    self.headerImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.headerImageView.clipsToBounds = YES;

    [self.headerView addSubview:self.headerImageView];
    [NSLayoutConstraint activateConstraints:@[
        [self.headerImageView.topAnchor constraintEqualToAnchor:self.headerView.topAnchor],
        [self.headerImageView.leadingAnchor constraintEqualToAnchor:self.headerView.leadingAnchor],
        [self.headerImageView.trailingAnchor constraintEqualToAnchor:self.headerView.trailingAnchor],
        [self.headerImageView.bottomAnchor constraintEqualToAnchor:self.headerView.bottomAnchor],
    ]];

    _table.tableHeaderView = self.headerView;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    tableView.tableHeaderView = self.headerView;
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];

}

- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];

    CGRect frame = self.table.bounds;
    frame.origin.y = -frame.size.height;

    self.navigationController.navigationController.navigationBar.barTintColor = [UIColor colorWithRed: 0.62 green: 0.67 blue: 0.98 alpha: 1.00];
    [self.navigationController.navigationController.navigationBar setShadowImage: [UIImage new]];
    self.navigationController.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationController.navigationBar.translucent = NO;

    self.enableSwitch.enabled = YES;

}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if (!([allKeys containsObject:@"hasCompletedSetup"]) || [[pfs objectForKey:@"hasCompletedSetup"] isEqual: @(NO)])
        [self presentIntroductionViewController];

    [self setEnableSwitchState];

}

- (void)viewWillDisappear:(BOOL)animated {

    [super viewWillDisappear:animated];

    [self.navigationController.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offsetY = scrollView.contentOffset.y;

    if (offsetY > 200) {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 1.0;
            self.titleLabel.alpha = 0.0;

        }];

    } else {
        [UIView animateWithDuration:0.2 animations:^{
            self.iconView.alpha = 0.0;
            self.titleLabel.alpha = 1.0;

        }];

    }
    
    if (offsetY > 0) offsetY = 0;
    self.headerImageView.frame = CGRectMake(0, offsetY, self.headerView.frame.size.width, 200 - offsetY);

}

- (void)toggleState {

    [[self enableSwitch] setEnabled:NO];

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if (!([[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"])) {
        enabled = YES;
        [preferences setBool:enabled forKey:@"Enabled"];
        [self respringUtil];
    } else if (!([allKeys containsObject:@"Enabled"])) {
        enabled = YES;
        [preferences setBool:enabled forKey:@"Enabled"];
        [self respringUtil];
    } else if ([[preferences objectForKey:@"Enabled"] isEqual:@(NO)]) {
        enabled = YES;
        [preferences setBool:enabled forKey:@"Enabled"];
        [self respringUtil];
    } else if ([[preferences objectForKey:@"Enabled"] isEqual:@(YES)]) {
        enabled = NO;
        [preferences setBool:enabled forKey:@"Enabled"];
        [self respringUtil];
    }

}

- (void)setEnableSwitchState {

    NSString* path = [NSString stringWithFormat:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"];
    NSMutableDictionary* dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    NSSet* allKeys = [NSSet setWithArray:[dictionary allKeys]];
    HBPreferences* preferences = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    
    if (!([[NSFileManager defaultManager] fileExistsAtPath:@"/var/mobile/Library/Preferences/sh.litten.rosepreferences.plist"]))
        [[self enableSwitch] setOn:NO animated:YES];
    else if (!([allKeys containsObject:@"Enabled"]))
        [[self enableSwitch] setOn:NO animated:YES];
    else if ([[preferences objectForKey:@"Enabled"] isEqual:@(YES)])
        [[self enableSwitch] setOn:YES animated:YES];
    else if ([[preferences objectForKey:@"Enabled"] isEqual:@(NO)])
        [[self enableSwitch] setOn:NO animated:YES];

}

- (void)presentIntroductionViewController {

    // i might could have done that better but it works :P
    
    BOOL isNotchSeries = nil;
    BOOL isHomeButtonSeries = nil;
    BOOL isMinis = nil;
    
    NSArray* NotchSeries = [NSArray arrayWithObjects: @"iPhone10,3", @"iPhone10,6", @"iPhone11,6", @"iPhone11,2", @"iPhone11,4", @"iPhone11,8", @"iPhone12,5", @"iPhone12,1", @"iPhone12,3", nil];
    NSArray* HomeButtonSeries = [NSArray arrayWithObjects: @"iPhone7,1", @"iPhone7,2", @"iPhone8,1", @"iPhone8,2", @"iPhone9,1", @"iPhone9,2", @"iPhone9,3", @"iPhone9,4", @"iPhone10,1", @"iPhone10,4", @"iPhone10,5", @"iPhone12,8", nil];
    NSArray* minis = [NSArray arrayWithObjects: @"iPhone6,1", @"iPhone8,4", nil];
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    for (NSString* stringFromArray in NotchSeries) {
        if ([deviceModel isEqualToString:stringFromArray]) {
            isNotchSeries = YES;
            isHomeButtonSeries = NO;
            isMinis = NO;
        }
    }
    
    for (NSString* stringFromArray in HomeButtonSeries) {
        if ([deviceModel isEqualToString:stringFromArray]) {
            isNotchSeries = NO;
            isHomeButtonSeries = YES;
            isMinis = NO;
        }
    }
    
    for (NSString* stringFromArray in minis) {
        if ([deviceModel isEqualToString:stringFromArray]) {
            isNotchSeries = NO;
            isHomeButtonSeries = NO;
            isMinis = YES;
        }
    }
    
    controller = [[UIViewController alloc] init];
    
    [[controller view] setBackgroundColor:[UIColor whiteColor]];
    [controller setModalPresentationStyle:UIModalPresentationFullScreen];
    
    CAGradientLayer* gradient = [[CAGradientLayer alloc] init];
    [gradient setFrame:[[controller view] bounds]];
    [gradient setStartPoint:CGPointMake(0.0, -0.5)];
    [gradient setEndPoint:CGPointMake(1.0, 1.0)];
    [gradient setColors:@[(id)[[UIColor colorWithRed: 1.00 green: 0.72 blue: 0.97 alpha: 1.00] CGColor], (id)[[UIColor whiteColor] CGColor]]];
    [gradient setLocations:@[@0,@1]];
    
    [[[controller view] layer] insertSublayer:gradient atIndex:0];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller.view.center.x + 100, controller.view.center.y)];
    CGPoint center = controller.view.center;
    if (isNotchSeries && !isHomeButtonSeries && !isMinis)
        center.y = controller.view.frame.size.height / 5; // Notch Series
    else if (!isNotchSeries && isHomeButtonSeries && !isMinis)
        center.y = controller.view.frame.size.height / 5; // Home Button Series
    else if (!isNotchSeries && !isHomeButtonSeries && isMinis)
        center.y = controller.view.frame.size.height / 5; // Mini Screens
    else
        center.y = controller.view.frame.size.height / 5;
    [headerLabel setCenter:center];
    [headerLabel setTextColor:[UIColor whiteColor]];
    [headerLabel setText:@"Welcome\nTo 🌹"];
    [headerLabel setNumberOfLines:2];
    [headerLabel setClipsToBounds:YES];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    [headerLabel setFont:[UIFont fontWithName: @"HelveticaNeue-Bold" size:40]];
    [headerLabel setAdjustsFontSizeToFitWidth:YES];
    [headerLabel setMinimumScaleFactor:0.5];
    [[headerLabel layer] setShadowColor:[[UIColor blackColor] CGColor]];
    [[headerLabel layer] setShadowRadius:10];
    [[headerLabel layer] setShadowOpacity:.2];
    [[headerLabel layer] setShadowOffset:CGSizeMake(0, 0)];
    
    UILabel* introductionText = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller.view.center.x + 50, controller.view.center.y)];
    CGPoint center2 = controller.view.center;
    center2.y = controller.view.frame.size.height / 2.75;
    [introductionText setCenter:center2];
    [introductionText setTextColor:[UIColor whiteColor]];
    [introductionText setText:@"Rose Will Automatically Set Everything Up For You So Just"];
    [introductionText setNumberOfLines:2];
    [introductionText setClipsToBounds:YES];
    [introductionText setTextAlignment:NSTextAlignmentCenter];
    [introductionText setFont:[UIFont fontWithName: @"HelveticaNeue-Regular" size:32]];
    [introductionText setAdjustsFontSizeToFitWidth:YES];
    [introductionText setMinimumScaleFactor:0.5];
    
    UILabel* introductionText2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, controller.view.center.x, controller.view.center.y)];
    CGPoint center23 = controller.view.center;
    if (isNotchSeries && !isHomeButtonSeries && !isMinis)
        center23.y = controller.view.frame.size.height / 2.5; // Notch Series
    else if (!isNotchSeries && isHomeButtonSeries && !isMinis)
        center23.y = controller.view.frame.size.height / 2.45; // Home Button Series
    else if (!isNotchSeries && !isHomeButtonSeries && isMinis)
        center23.y = controller.view.frame.size.height / 2.4; // Mini Screens
    else
        center23.y = controller.view.frame.size.height / 2.5;
    [introductionText2 setCenter:center23];
    [introductionText2 setTextColor:[UIColor whiteColor]];
    [introductionText2 setText:@"Lean Back"];
    [introductionText2 setNumberOfLines:1];
    [introductionText2 setClipsToBounds:YES];
    [introductionText2 setTextAlignment:NSTextAlignmentCenter];
    [introductionText2 setFont:[UIFont fontWithName: @"HelveticaNeue-Medium" size:20]];
    [introductionText2 setAdjustsFontSizeToFitWidth:YES];
    [introductionText2 setMinimumScaleFactor:0.5];

    loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 50.0f, 50.0f)];
    CGPoint center3 = controller.view.center;
    center2.y = controller.view.frame.size.height / 1.5;
    [loadingIndicator setCenter:center3];
    [loadingIndicator setColor:[UIColor whiteColor]];
    [loadingIndicator setAlpha:0.0];
    
    continueButton = [[UIButton alloc] init];
    if (isNotchSeries && !isHomeButtonSeries && !isMinis)
        [continueButton setFrame:CGRectMake(controller.view.center.x - 125, 600, 250.0f, 50.0f)]; // Notch Series
    else if (!isNotchSeries && isHomeButtonSeries && !isMinis)
        [continueButton setFrame:CGRectMake(controller.view.center.x - 125, 500, 250.0f, 50.0f)]; // Home Button Series
    else if (!isNotchSeries && !isHomeButtonSeries && isMinis)
        [continueButton setFrame:CGRectMake(controller.view.center.x - 125, 470, 250.0f, 50.0f)]; // Mini Screens
    else
        continueButton.frame = CGRectMake(controller.view.center.x - 125, 600, 250.0f, 50.0f);
    [continueButton addTarget:self action:@selector(setup) forControlEvents:UIControlEventTouchUpInside];
    [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    [continueButton setBackgroundColor:[UIColor colorWithRed:1.00 green:0.18 blue:0.33 alpha:1.0]];
    [[continueButton titleLabel] setFont:[UIFont systemFontOfSize:17]];
    [[continueButton layer] setCornerRadius:10];
    [continueButton setTintColor:[UIColor blackColor]];

    UIImageView* rose = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/RosePrefs.bundle/rose.png"]];
    if (isNotchSeries && !isHomeButtonSeries && !isMinis)
        [rose setFrame:CGRectMake(0, 500, 250, 250)]; // Notch Series
    else if (!isNotchSeries && isHomeButtonSeries && !isMinis)
        [rose setFrame:CGRectMake(0, 450, 250, 250)]; // Home Button Series
    else if (!isNotchSeries && !isHomeButtonSeries && isMinis)
        [rose setFrame:CGRectMake(0, 370, 250, 250)]; // Mini Screens
    else
        [rose setFrame:CGRectMake(0, 500, 250, 250)];
    [rose setContentMode:UIViewContentModeScaleAspectFill];
    [rose setAlpha:.3];
    rose.transform = CGAffineTransformMakeRotation(130);
    
    [[controller view] addSubview:rose];
    [[controller view] addSubview:headerLabel];
    [[controller view] addSubview:introductionText];
    [[controller view] addSubview:introductionText2];
    [[controller view] addSubview:loadingIndicator];
    [[controller view] addSubview:continueButton];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (void)setup {
            
    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    enabled = YES;
    hasCompletedSetup = YES;
    [pfs setBool:enabled forKey: @"Enabled"];
    [pfs setBool:hasCompletedSetup forKey:@"hasCompletedSetup"];
    [continueButton setEnabled:NO];
    [continueButton setAlpha:0.7];
    [[self enableSwitch] setOn:YES animated: YES];
    [loadingIndicator setAlpha:1.0];
    [loadingIndicator startAnimating];

    NSArray* tapticEngineDevices = [NSArray arrayWithObjects: @"iPhone9,1", @"iPhone9,3", @"iPhone9,2", @"iPhone9,4", @"iPhone10,1", @"iPhone10,4", @"iPhone10,2", @"iPhone10,5", @"iPhone10,3", @"iPhone10,6", @"iPhone11,2", @"iPhone11,4", @"iPhone11,6", @"iPhone11,8", @"iPhone12,1", @"iPhone12,3", @"iPhone12,5", @"iPhone12,8", nil];
    NSArray* hapticEngineDevices = [NSArray arrayWithObjects: @"iPhone8,1", @"iPhone8,2", nil];
    NSArray* oldEngineDevices = [NSArray arrayWithObjects: @"iPhone6,1", @"iPhone6,2", @"iPhone7,1", @"iPhone7,2", @"iPhone8,4", nil];

    struct utsname systemInfo;
    uname(&systemInfo);
    NSString* deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
            
    for (NSString* stringFromArray in tapticEngineDevices) {
        if ([deviceModel isEqualToString:stringFromArray]) {
            isTapticEngineDevice = YES;
            isHapticEngineDevice = NO;
            isOldEngineDevice = NO;
        }
    }

    for (NSString* stringFromArray in hapticEngineDevices) {
        if ([deviceModel isEqualToString:stringFromArray]) {
            isTapticEngineDevice = NO;
            isHapticEngineDevice = YES;
            isOldEngineDevice = NO;
        }
    }

    for (NSString* stringFromArray in oldEngineDevices) {
        if ([deviceModel isEqualToString:stringFromArray]) {
            isTapticEngineDevice = NO;
            isHapticEngineDevice = NO;
            isOldEngineDevice = YES;
        }
    }

    if (isTapticEngineDevice) {
        enableTapticEngineSwitch = YES;
        enableHapticEngineSwitch = NO;
        enableLegacyEngineSwitch = NO;
        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];
    } else if (isHapticEngineDevice) {
        enableTapticEngineSwitch = NO;
        enableHapticEngineSwitch = YES;
        enableLegacyEngineSwitch = NO;
        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];
    } else if (isOldEngineDevice) {
        enableTapticEngineSwitch = NO;
        enableHapticEngineSwitch = NO;
        enableLegacyEngineSwitch = YES;
        [pfs setBool:enableTapticEngineSwitch forKey:@"enableTapticEngine"];
        [pfs setBool:enableHapticEngineSwitch forKey:@"enableHapticEngine"];
        [pfs setBool:enableLegacyEngineSwitch forKey:@"enableLegacyEngine"];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3.0 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{

        [self respringUtil];

    });
    
}

- (void)resetPrompt {

    UIAlertController *resetAlert = [UIAlertController alertControllerWithTitle:@"Rose"
	message:@"Do You Really Want To Reset Your Preferences?"
	preferredStyle:UIAlertControllerStyleActionSheet];
	
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Yep" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
			
            [self resetPreferences];

	}];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Nope" style:UIAlertActionStyleCancel handler:nil];

	[resetAlert addAction:confirmAction];
	[resetAlert addAction:cancelAction];

	[self presentViewController:resetAlert animated:YES completion:nil];

}

- (void)resetPreferences {

    HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
    for (NSString *key in [pfs dictionaryRepresentation]) {
        [pfs removeObjectForKey:key];
    }

    [self respringUtil];

}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    
    if (event.type == UIEventSubtypeMotionShake) {
        HBPreferences *pfs = [[HBPreferences alloc] initWithIdentifier: @"sh.litten.rosepreferences"];
        enableTapticEngineSwitch = [[pfs objectForKey:@"enableTapticEngine"] boolValue];
        enableHapticEngineSwitch = [[pfs objectForKey:@"enableHapticEngine"] boolValue];
        enableLegacyEngineSwitch = [[pfs objectForKey:@"enableLegacyEngine"] boolValue];
        haptics = [[roseCall alloc] init];
        int tapticLVL = [[pfs objectForKey:@"TapticStrength"] intValue];
		int hapticLVL = [[pfs objectForKey:@"HapticStrength"] intValue];
		int selectedLegacyMode = [[pfs objectForKey:@"LegacyStrength"] intValue];
		double customLegacyDuration = [[pfs objectForKey:@"customLegacyDuration"] doubleValue];
		double customLegacyStrength = [[pfs objectForKey:@"customLegacyStrength"] doubleValue];

        if (enableTapticEngineSwitch || enableHapticEngineSwitch) {
            [haptics prepareForHaptic:enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                [haptics prepareForHaptic:enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                    [haptics prepareForHaptic:enableTapticEngineSwitch :enableHapticEngineSwitch :enableLegacyEngineSwitch :tapticLVL :hapticLVL];

                });

            });
        } else if (enableLegacyEngineSwitch && selectedLegacyMode == 0) {
            [haptics prepareLegacyFeedback:0.025 intensivity:0.05 count:1];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                [haptics prepareLegacyFeedback:0.025 intensivity:0.05 count:1];

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                    [haptics prepareLegacyFeedback:0.025 intensivity:0.05 count:1];

                });

            });
        } else if (enableLegacyEngineSwitch && selectedLegacyMode != 0) {
            [haptics prepareLegacyFeedback:customLegacyDuration intensivity:customLegacyStrength count:1];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                    [haptics prepareLegacyFeedback:customLegacyDuration intensivity:customLegacyStrength count:1];

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                
                        [haptics prepareLegacyFeedback:customLegacyDuration intensivity:customLegacyStrength count:1];

                    });

            });
        }

    }

}

- (void)respringUtil {

    pid_t pid;
    const char *args[] = {"killall", "backboardd", NULL};

    [HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Rose"]];

    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);

}

@end