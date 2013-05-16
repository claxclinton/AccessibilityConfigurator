//
//  TraitTableViewCell.h
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TraitsTableViewCell;

@protocol TraitTableViewCellDelegateProtocol <NSObject>

- (void)traitTableViewCell:(TraitsTableViewCell *)cell didChangeStateToOn:(BOOL)on;

@end

@interface TraitsTableViewCell : UITableViewCell

@property (assign, nonatomic) NSInteger row;
@property (weak, nonatomic) IBOutlet UISwitch *enableSwitch;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) id <TraitTableViewCellDelegateProtocol> delegate;

- (void)toggle;

@end
