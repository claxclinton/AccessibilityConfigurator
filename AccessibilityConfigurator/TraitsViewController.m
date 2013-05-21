//
//  SecondViewController.m
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import "TraitsViewController.h"

enum kTraitsCellPosition {
    kTraitsCellPositionButton = 0,
    kTraitsCellPositionImage = 1,
    kTraitsCellPositionStaticText = 2,
    kTraitsCellPositionSearchField = 3,
    kTraitsCellPositionPlaysSound = 4,
    kTraitsCellPositionKeyboardKey = 5,
    kTraitsCellPositionSummaryElement = 6,
    kTraitsCellPositionUpdatesFrequently = 7,
    kTraitsCellPositionUserInteractionEnabled = 8,
    kTraitsCellPositionLink = 9,
    kTraitsCellPositionSelected = 10,
    kTraitsCellPositionCount = 11,
};

@interface TraitsViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TraitsViewController

@synthesize testView = _testView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Traits", @"Traits");
        self.tabBarItem.image = [UIImage imageNamed:@"traits"];
    }
    return self;
}
							
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView registerNib:[UINib nibWithNibName:@"TraitTableViewCellView" bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"TraitTableViewCellView"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.testView = self.testView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kTraitsCellPositionCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TraitsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TraitTableViewCellView"];
    cell.delegate = self;
    switch (indexPath.row) {
        case kTraitsCellPositionButton:
            cell.title.text = @"Button";
            break;
        case kTraitsCellPositionImage:
            cell.title.text = @"Image";
            break;
        case kTraitsCellPositionStaticText:
            cell.title.text = @"Static Text";
            break;
        case kTraitsCellPositionSearchField:
            cell.title .text= @"Search Field";
            break;
        case kTraitsCellPositionPlaysSound:
            cell.title.text = @"Plays Sound";
            break;
        case kTraitsCellPositionKeyboardKey:
            cell.title.text = @"Keyboard Key";
            break;
        case kTraitsCellPositionSummaryElement:
            cell.title.text = @"Summary Element";
            break;
        case kTraitsCellPositionUpdatesFrequently:
            cell.title.text = @"Updates Frequently";
            break;
        case kTraitsCellPositionUserInteractionEnabled:
            cell.title.text = @"User Interaction Enabled";
            break;
        case kTraitsCellPositionLink:
            cell.title.text = @"Link";
            break;
        case kTraitsCellPositionSelected:
            cell.title.text = @"Selected";
            break;
        default:
            break;
    }
    cell.row = indexPath.row;
    return cell;
}

- (void)updateTraitOnView:(UIView *)view trait:(UIAccessibilityTraits)trait on:(BOOL)on
{
    NSAssert(view != nil, @"");
    if (on) {
        view.accessibilityTraits |= trait;
    } else {
        view.accessibilityTraits &= ~trait;
    }
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, nil);
}

- (UIAccessibilityTraits)traitFromCellPosition:(NSInteger)cellPosition
{
    UIAccessibilityTraits trait = 0;
    switch (cellPosition) {
        case kTraitsCellPositionButton:
            trait = UIAccessibilityTraitButton;
            break;
        case kTraitsCellPositionImage:
            trait = UIAccessibilityTraitImage;
            break;
        case kTraitsCellPositionStaticText:
            trait = UIAccessibilityTraitStaticText;
            break;
        case kTraitsCellPositionSearchField:
            trait = UIAccessibilityTraitSearchField;
            break;
        case kTraitsCellPositionPlaysSound:
            trait = UIAccessibilityTraitPlaysSound;
            break;
        case kTraitsCellPositionKeyboardKey:
            trait = UIAccessibilityTraitKeyboardKey;
            break;
        case kTraitsCellPositionSummaryElement:
            trait = UIAccessibilityTraitSummaryElement;
            break;
        case kTraitsCellPositionUpdatesFrequently:
            trait = UIAccessibilityTraitUpdatesFrequently;
            break;
        case kTraitsCellPositionUserInteractionEnabled:
            trait = UIAccessibilityTraitNotEnabled;
            break;
        case kTraitsCellPositionLink:
            trait = UIAccessibilityTraitLink;
            break;
        case kTraitsCellPositionSelected:
            trait = UIAccessibilityTraitSelected;
            break;
        default:
            break;
    }
    return trait;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TraitsTableViewCell *cell = (TraitsTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    [cell toggle];
    BOOL on = cell.enableSwitch.on;
    UIAccessibilityTraits traits = [self traitFromCellPosition:indexPath.row];
    [self updateTraitOnView:self.testView trait:traits on:on];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35.0f;
}

#pragma mark - Trait Table View Cell Delegate

- (void)traitTableViewCell:(TraitsTableViewCell *)cell didChangeStateToOn:(BOOL)on
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:cell.row inSection:0];
    UIAccessibilityTraits traits = [self traitFromCellPosition:indexPath.row];
    [self updateTraitOnView:self.testView trait:traits on:on];
}

#pragma mark - Test View

- (UIView *)testView
{
    return _testView;
}

- (void)setTestView:(UIView *)testView
{
    _testView = testView;
    NSInteger numberOfRows = [self tableView:self.tableView numberOfRowsInSection:0];
    for (int i = 0; i < numberOfRows; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        TraitsTableViewCell *cell = (TraitsTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
        UIAccessibilityTraits traits = [self traitFromCellPosition:indexPath.row];
        cell.enableSwitch.on = (self.testView.accessibilityTraits & traits) ? YES : NO;
    }
}


@end
