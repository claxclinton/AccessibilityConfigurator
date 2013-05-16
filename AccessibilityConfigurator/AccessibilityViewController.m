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

@end

@implementation AccessibilityViewController

@synthesize testView = _testView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
}

- (UIView *)testView {
    return _testView;
}

- (void)setTestView:(UIView *)testView {
    _testView = testView;
    self.elementSwitch.on = testView.isAccessibilityElement;
    self.labelTextField.text = testView.accessibilityLabel;
    self.hintTextField.text = testView.accessibilityHint;
}

@end
