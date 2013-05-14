//
//  AppDelegate.h
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
