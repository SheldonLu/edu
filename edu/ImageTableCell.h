//
//  ImageTableCell.h
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageTableCell : UITableViewCell
@property(nonatomic,weak) IBOutlet UIImageView *imageView;
@property(nonatomic,weak) IBOutlet UIImageView *imageOtherView;
@property(nonatomic,weak) IBOutlet UILabel *titleLabel;
@property(nonatomic,weak) IBOutlet UILabel *numLabel;
@property(nonatomic,weak) IBOutlet UILabel *titleotherLabel;
@property(nonatomic,weak) IBOutlet UILabel *numotherLabel;
@property(nonatomic,weak) IBOutlet UIImageView *commentImageView;
@property(nonatomic,weak) IBOutlet UIImageView *commentOtherImageView;
- (IBAction)myclick:(id)sender;
@end
