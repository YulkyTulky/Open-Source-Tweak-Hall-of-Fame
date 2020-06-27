#include "HPGestureRecognizerDelegate.h"

@implementation HPGestureRecognizerDelegate

- (instancetype)initWithGestureRecognizer:(UIGestureRecognizer *)arg1 containingView:(UIView *)arg2
{
    self = [super init];

    if (self) {
        self.recognizer = arg1;
        self.containingView = arg2;
        self.largerHitBox = NO;
        self.ignoreAll = NO;
    }

    return self;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer 
shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer 
shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer 
{
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
  return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return YES;

    if (self.ignoreAll == YES)
    {
        return NO;
    }
    if (gestureRecognizer == self.recognizer)
    {
        CGPoint locationInView = [gestureRecognizer locationInView:self.containingView];
        if (!self.largerHitBox)
        {
            if (locationInView.y > 40 && locationInView.x > 120)
            {
                return NO;
            }
            return YES;
        }
        else
        {
            CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
            CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
            if (((0.15*screenHeight) <= locationInView.y && locationInView.y <= (0.85*screenHeight)) && ((0.15*screenWidth) <= locationInView.x && locationInView.x <= (0.85*screenWidth)))
            {
                return NO;
            }
            return YES;
        }
    }
    return NO;
}


@end