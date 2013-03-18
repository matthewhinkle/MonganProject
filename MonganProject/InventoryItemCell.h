//
//  InventoryItemCell.h
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DesiredItemAndProductAreBothHeldInThisClass.h"
#import "AsyncImageView.h"

@interface InventoryItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalSpacer;
@property (weak, nonatomic) IBOutlet AsyncImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

-(void) renderDesiredItem:(DesiredItemAndProductAreBothHeldInThisClass *)item;

@end
