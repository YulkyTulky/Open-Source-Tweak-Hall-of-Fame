//
// HPSpacingControllerView.m
// HomePlus
//
// Controller View for editing Horizontal/Vertical Spacing
// H Spacing is oft refered to in this tweak as "Side Inset"
// Depending on the situation, users actually want side inset instead of H Spacing
//      And typically when they actually want H spacing, its because they have a Left
//      offset, *so*, when they've changed Left Offset, give them real H spacing
//      It works beautifully 
//
// Author:  Kritanta
// Created: Dec 2019
//


#include "HPSpacingControllerView.h"
#include "EditorManager.h"
#include "HPUtility.h"
#include "HPDataManager.h"

@implementation HPSpacingControllerView

/*
Properties: 
    @property (nonatomic, retain) UIView *topView;
    @property (nonatomic, retain) UIView *bottomView;

    @property (nonatomic, retain) UILabel *topLabel;
    @property (nonatomic, retain) OBSlider *topControl;
    @property (nonatomic, retain) UITextField *topTextField;

    @property (nonatomic, retain) UILabel *bottomLabel;
    @property (nonatomic, retain) OBSlider *bottomControl;
    @property (nonatomic, retain) UITextField *bottomTextField;
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) 
    {
        [self layoutControllerView];
    }

    return self;
}

-(void)layoutControllerView
{
    [super layoutControllerView];

    NSString *x = [[[EditorManager sharedManager] editingLocation] substringFromIndex:14];

    self.topLabel.text = [HPUtility localizedItem:@"VERTICAL_SPACING"];
    self.bottomLabel.text = [HPUtility localizedItem:@"HORIZONTAL_SPACING"];

    self.topControl.minimumValue = -400;
    self.topControl.maximumValue = 400;

    self.bottomControl.minimumValue = -200.0;
    self.bottomControl.maximumValue = 400.0;    

    
    self.topControl.value = [[[HPDataManager sharedManager] currentConfiguration] floatForKey:[NSString stringWithFormat:@"%@%@%@", @"HPThemeDefault", x, @"VerticalSpacing"]];
    self.topTextField.text = [NSString stringWithFormat:@"%.0f", self.topControl.value];
    self.bottomControl.value = [[[HPDataManager sharedManager] currentConfiguration] floatForKey:[NSString stringWithFormat:@"%@%@%@", @"HPThemeDefault", x, @"SideInset"]];
    self.bottomTextField.text = [NSString stringWithFormat:@"%.0f", self.bottomControl.value];
}

- (void)topSliderUpdated:(UISlider *)sender
{
    NSString *x = [[[EditorManager sharedManager] editingLocation] substringFromIndex:14];

    [[[HPDataManager sharedManager] currentConfiguration] setFloat:sender.value
                forKey:[NSString stringWithFormat:@"HPThemeDefault%@%@", x, @"VerticalSpacing"]];
    self.topTextField.text = [NSString stringWithFormat:@"%.0f", sender.value];

    [super topSliderUpdated:sender];
}

- (void)bottomSliderUpdated:(UISlider *)sender
{
    NSString *x = [[[EditorManager sharedManager] editingLocation] substringFromIndex:14];

    [[[HPDataManager sharedManager] currentConfiguration] setFloat:sender.value
                forKey:[NSString stringWithFormat:@"HPThemeDefault%@%@", x, @"SideInset"]];
    self.bottomTextField.text = [NSString stringWithFormat:@"%.0f", sender.value];

    [super bottomSliderUpdated:sender];
}


- (void)handleTopResetButtonPress:(UIButton*)sender 
{
    [super handleTopResetButtonPress:sender];
    self.topControl.value = 0;
    [self topSliderUpdated:self.topControl];
}
- (void)handleBottomResetButtonPress:(UIButton*)sender 
{
    [super handleBottomResetButtonPress:sender];
    self.bottomControl.value = 0;
    [self bottomSliderUpdated:self.bottomControl];
}



@end