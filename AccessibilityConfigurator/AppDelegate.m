//
//  AppDelegate.m
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import "AppDelegate.h"
#import "TestViewController.h"
#import "AccessibilityViewController.h"
#import "TraitsViewController.h"

@interface AppDelegate ()

@property (strong) TestViewController *testViewController;
@property (strong) AccessibilityViewController *accessibilityViewController;
@property (strong) TraitsViewController *traitsViewController;

@end

@implementation AppDelegate

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"testView"]) {
        self.accessibilityViewController.testView = self.testViewController.testView;
        self.traitsViewController.testView = self.testViewController.testView;
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.testViewController = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    self.testViewController.title = @"Test";
    
    self.accessibilityViewController = [[AccessibilityViewController alloc] initWithNibName:@"AccessibilityViewController" bundle:nil];
    self.accessibilityViewController.title = @"Accessibility";

    self.traitsViewController = [[TraitsViewController alloc] initWithNibName:@"TraitsViewController" bundle:nil];
    self.traitsViewController.testView = self.testViewController.testView;
    self.traitsViewController.title = @"Traits";
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[self.testViewController, self.accessibilityViewController, self.traitsViewController];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    [self.testViewController addObserver:self forKeyPath:@"testView"
                                 options:(NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew) context:nil];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
