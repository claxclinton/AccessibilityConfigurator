//
//  FirstViewController.m
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (weak, nonatomic) IBOutlet UIView *redSquareView;

@end

@implementation TestViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"TestViewController", @"Controllers");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    TestContainerView *testView = (TestContainerView *)self.view;
    testView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.testView = self.redSquareView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testContainerView:(TestContainerView *)testContainerView changedToTestView:(UIView *)testView
{
    self.testView = testView;
}

@end
