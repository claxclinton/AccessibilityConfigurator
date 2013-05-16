//
//  SecondViewController.h
//  AccessibilityConfigurator
//
//  Created by Claes Lilliesköld on 2013-05-14.
//  Copyright (c) 2013 Claes Lilliesköld. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TraitsTableViewCell.h"

@interface TraitsViewController : UIViewController
<UITableViewDataSource,
UITableViewDelegate,
TraitTableViewCellDelegateProtocol>

@property (weak) UIView *testView;

@end
