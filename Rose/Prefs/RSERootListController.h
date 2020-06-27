#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>

@interface RSEAppearanceSettings : HBAppearanceSettings
@end

@interface RSERootListController : HBRootListController {
    UITableView * _table;
}
@property(nonatomic, retain)UISwitch* enableSwitch;
@property(nonatomic, retain)UIView* headerView;
@property(nonatomic, retain)UIImageView* headerImageView;
@property(nonatomic, retain)UILabel* titleLabel;
@property(nonatomic, retain)UIImageView* iconView;
- (void)toggleState;
- (void)setEnableSwitchState;
- (void)presentIntroductionViewController;
- (void)setup;
- (void)resetPrompt;
- (void)resetPreferences;
- (void)respringUtil;
@end