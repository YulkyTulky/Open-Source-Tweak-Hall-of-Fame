//
// HPControllerView.h
// HomePlus
//
// Authors: Kritanta
// Created  Oct 2019
//

#include <UIKit/UIKit.h>
#include "OBSlider.h"

#define kLeftScreenBuffer 0.146
#define kTopContainerTopAnchor 0.036
#define kContainerHeight 0.123
#define kResetButtonSize 25.0

@interface HPControllerView : UIView

@property (nonatomic, retain) UIView *topView;
@property (nonatomic, retain) UIView *bottomView;

@property (nonatomic, retain) UILabel *topLabel;
@property (nonatomic, retain) OBSlider *topControl;
@property (nonatomic, retain) UITextField *topTextField;

@property (nonatomic, retain) UILabel *bottomLabel;
@property (nonatomic, retain) OBSlider *bottomControl;
@property (nonatomic, retain) UITextField *bottomTextField;

@property (nonatomic, retain) UIButton *topResetButton;
@property (nonatomic, retain) UIButton *bottomResetButton;

- (void)layoutControllerView;

- (void)topSliderUpdated:(UISlider *)slider;
- (void)bottomSliderUpdated:(UISlider *)slider;

- (void)topTextFieldBeganEditing:(UITextField *)textField;
- (void)topTextFieldEndedEditing:(UITextField *)textField;
- (void)topTextFieldUpdated:(UITextField *)textField;
- (void)invertTopTextField;

- (void)bottomTextFieldBeganEditing:(UITextField *)textField;
- (void)bottomTextFieldEndedEditing:(UITextField *)textField;
- (void)bottomTextFieldUpdated:(UITextField *)textField;

- (void)invertBottomTextField;

- (void)handleTopResetButtonPress:(UIButton*)sender;
- (void)handleBottomResetButtonPress:(UIButton*)sender;

@end
