//
//  AccessibilityViewController.m
//  AccessibilityConfigurator
//
//  Created by Claes Lillieskold on 2013-05-16.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import "AccessibilityViewController.h"

@interface AccessibilityViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *elementSwitch;
@property (weak, nonatomic) IBOutlet UITextField *labelTextField;
@property (weak, nonatomic) IBOutlet UITextField *hintTextField;
@property (weak, nonatomic) IBOutlet UISwitch *modalViewSwitch;

@end

@implementation AccessibilityViewController

@synthesize testView = _testView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.image = [UIImage imageNamed:@"accessibility"];
    }
    return self;
}

- (void)viewDidLoad
{   
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.testView = self.testView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)accessibilityElementChanged:(id)sender
{
    self.testView.isAccessibilityElement = self.elementSwitch.on;
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, nil);
}

- (IBAction)modalViewPropertyChanged:(id)sender
{
    self.testView.accessibilityViewIsModal = self.modalViewSwitch.on;
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, nil);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.labelTextField) {
        self.testView.accessibilityLabel = textField.text;
    } else if (textField == self.hintTextField) {
        self.testView.accessibilityHint = textField.text;
    }
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, nil);
}

- (void)updateAccessibilitySettingsFromTestView
{
    self.elementSwitch.on = _testView.isAccessibilityElement;
    self.labelTextField.text = _testView.accessibilityLabel;
    self.hintTextField.text = _testView.accessibilityHint;
    self.modalViewSwitch.on = _testView.accessibilityViewIsModal;
}

- (UIView *)testView
{
    return _testView;
}

- (void)setTestView:(UIView *)testView
{
    _testView = testView;
    [self updateAccessibilitySettingsFromTestView];
}

@end
