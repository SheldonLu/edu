//
//  ImageDetailViewController.m
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "ImageDetailViewController.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>
@interface ImageDetailViewController ()

@end

@implementation ImageDetailViewController
@synthesize itemDirtionary;
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
	// Do any additional setup after loading the view.
    CGRect r = [ UIScreen mainScreen ].applicationFrame;
    CGSize size = r.size;
    CGFloat width = size.width;
    CGFloat height =size.height-20;
    

    
    self.imageView.frame=CGRectMake(0 ,0, width,height);
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://i.imgur.com/%@%@", [itemDirtionary objectForKey:@"hash"], [itemDirtionary objectForKey:@"ext"]]];
    self.view.backgroundColor = [UIColor clearColor];
    [self.imageView setImageWithURL:URL];
    

    self.imageView.frame=CGRectMake(0 ,height, width,20);

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
