//
//  CreateAlbumViewController.m
//  edu
//
//  Created by lubing on 13-3-28.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "CreateAlbumViewController.h"

@interface CreateAlbumViewController ()

@end

@implementation CreateAlbumViewController

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
     self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jz_02.png"]];
	// Do any additional setup after loading the view.
    self.descTextField.returnKeyType =UIReturnKeyDone;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
