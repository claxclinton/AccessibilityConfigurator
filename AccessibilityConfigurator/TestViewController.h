//
//  FirstViewController.h
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestContainerView.h"

@interface TestViewController : UIViewController <TestContainerViewDelegateProtocol>

@property (weak, nonatomic) IBOutlet UIView *testView;

@end
