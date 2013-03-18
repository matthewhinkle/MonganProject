//
//  InventoryItemCell.m
//  MonganProject
//
//  Created by Mike Hershey on 3/17/13.
//  Copyright (c) 2013 Matthew Hinkle. All rights reserved.
//

#import "InventoryItemCell.h"

@implementation InventoryItemCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) renderDesiredItem:(DesiredItemAndProductAreBothHeldInThisClass *)item
{
    if(item.product.imageUrl) {
        [self.horizontalSpacer setConstant:85];
    } else {
        [self.horizontalSpacer setConstant:5];
    }
    self.titleLabel.text = item.product.productName;
    self.descriptionLabel.text = item.product.description;
    self.amountLabel = [NSString stringWithFormat:@"%@/%@", item.desiredItem.owned, item.desiredItem.desired];
}

-(void) prepareForReuse
{
    self.thumbnail.image = nil;
}

@end
