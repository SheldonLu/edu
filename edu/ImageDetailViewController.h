//
//  ImageDetailViewController.h
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UIViewController
@property(nonatomic,strong) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) NSDictionary *itemDirtionary;
@property(nonatomic,strong) IBOutlet UIView *containView;
@end
