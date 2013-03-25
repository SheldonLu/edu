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
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"http://i.imgur.com/%@%@", [itemDirtionary objectForKey:@"hash"], [itemDirtionary objectForKey:@"ext"]]];
    [self.imageView setImageWithURL:URL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
