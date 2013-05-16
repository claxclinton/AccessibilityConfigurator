//
//  TraitTableViewCell.m
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import "TraitsTableViewCell.h"

@implementation TraitsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)enableSwitchChanged:(id)sender
{
    [self.delegate traitTableViewCell:self didChangeStateToOn:self.enableSwitch.on];
}

- (void)toggle
{
    self.enableSwitch.on = !self.enableSwitch.on;
}

@end
