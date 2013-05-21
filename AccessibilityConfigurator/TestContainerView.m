//
//  TestView.m
//  AccessibilityConfigurator
//
//  Created by Claes Lillieskold on 2013-05-21.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import "TestContainerView.h"

@implementation TestContainerView
{
    UIView *overlayView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *view = [super hitTest:point withEvent:event];
    if (view != nil && view != self && view != overlayView) {
        [self.delegate testContainerView:self changedToTestView:view];
    }
    if (overlayView == nil) {
        [self flashView:view];
    } 
    return view;
}

- (void)flashView:(UIView *)view
{
    overlayView = [[UIView alloc] initWithFrame:view.bounds];
    overlayView.backgroundColor = [UIColor whiteColor];
    overlayView.alpha = 0;
    [view addSubview:overlayView];

    [UIView animateWithDuration:0.15 animations:^{
        overlayView.alpha = 0.6;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            overlayView.alpha = 0;
        } completion:^(BOOL finished) {
            [overlayView removeFromSuperview];
            overlayView = nil;
        }];
    }];
}

@end
