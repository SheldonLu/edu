//
//  ImageTableCell.m
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "ImageTableCell.h"

@implementation ImageTableCell
@synthesize imageView;
@synthesize imageOtherView;
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
@end
