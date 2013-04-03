//
//  NoticeDetailViewController.m
//  edu
//
//  Created by lubing on 13-3-31.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "NoticeDetailViewController.h"

@interface NoticeDetailViewController ()

@end

@implementation NoticeDetailViewController
@synthesize detailLabel;
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
    self.view.backgroundColor = [UIColor clearColor];
    self.detailLabel.backgroundColor = [UIColor clearColor];

    
    NSString *str = @"生长在非洲荒漠地带的依米花，默默无闻,少有人注意过它。许多旅人以为它只是一株草而已。但是,它会在一生中的某个清晨突然绽放出美丽的花朵。那是无比绚丽的一朵花，似乎要占尽人世间所有色彩一样。它的花瓣儿呈莲叶状儿,每瓣自成一色：红、白、黄、蓝，与非洲大地上空的毒日争艳。但是，它的花期很短,最多只有两天。两天后它就会随着母株一起枯萎，开花意味着它的生命的终结。";
    CGSize size = [str sizeWithFont:self.detailLabel.font constrainedToSize:self.view.bounds.size lineBreakMode:UILineBreakModeWordWrap];
    CGRect rect = self.detailLabel.frame;
    rect.size.height = size.height;
    self.detailLabel.frame = rect;
    self.detailLabel.lineBreakMode = UILineBreakModeWordWrap;
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.text= str;
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
