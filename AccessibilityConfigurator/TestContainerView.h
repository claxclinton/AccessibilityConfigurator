//
//  TestContainerView.h
//  AccessibilityConfigurator
//
//  Created by Claes Lillieskold on 2013-05-21.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestContainerView;

@protocol TestContainerViewDelegateProtocol <NSObject>

- (void)testContainerView:(TestContainerView *)testContainerView changedToTestView:(UIView *)testView;

@end

@interface TestContainerView : UIView

@property (weak, nonatomic) id <TestContainerViewDelegateProtocol> delegate;

@end
