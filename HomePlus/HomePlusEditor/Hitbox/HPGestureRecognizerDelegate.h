#include <UIKit/UIKit.h>

@interface HPGestureRecognizerDelegate<UIGestureRecognizerDelegate> : NSObject

@property (nonatomic, retain) UIGestureRecognizer *recognizer;
@property (nonatomic, retain) UIView *containingView;
@property (nonatomic, assign) BOOL largerHitBox;
@property (nonatomic, assign) BOOL ignoreAll;
- (instancetype)initWithGestureRecognizer:(UIGestureRecognizer *)arg1 containingView:(UIView *)arg2;

@end