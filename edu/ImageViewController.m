//
//  ImageViewController.m
//  edu
//
//  Created by lubing on 13-3-24.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageTableCell.h"
#import "AlbumImageViewController.h"
#import "EduAppDelegate.h"
@interface ImageViewController ()

@end

@implementation ImageViewController
{
    NSArray *imageArray;
    NSArray *titleArray;
}
@synthesize imageTableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jz_02.png"]];
//    self.view.superview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jz_02.png"]];
//    UIImage *bg = [UIImage imageNamed:@"jz_02.png"];
//    UIImageView *imageBg= [[UIImageView alloc]initWithImage:bg];
//    [imageBg setAlpha:0.2];//设置透明度～～～ 0.2是我自己想要的效果，根据自己看选择多少；
//    //[imageController setAnimationDuration:1.2f];  //这个和下面那句都是实现动态背景的，所以这里没用哈～
//    //[imageController startAnimating];
//    self.backgroundPicture = imageBg;    //backgroundPicture 是uiimageView,在前面头文件声明了的。
//    [self.view insertSubview:self.backgroundPicture atIndex:0];//全人类都知道这句话什么意思
    
    
    imageArray = [[NSArray alloc] initWithObjects:@"modo.jpg",@"tc.png",@"tcbj.png",@"new.png",nil];
    titleArray = [[NSArray alloc] initWithObjects:@"个人相册",@"班级相册", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    static NSString *simpleTableIdentifier = @"ImageCell";
    ImageTableCell *cell = (ImageTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell ==nil){
        cell = [[ImageTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }

    cell.imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row*2]];
    if (imageArray.count>indexPath.row*2+1) {
        cell.imageOtherView.image = [UIImage imageNamed:[imageArray objectAtIndex:indexPath.row*2+1]];
        cell.clipsToBounds = NO;
        cell.imageOtherView.tag = indexPath.row*2+1;

        cell.imageOtherView.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testclick:)];
        [cell.imageOtherView addGestureRecognizer:singleTap];
    }
    
   int choose_l_or_r=[[NSNumber numberWithInteger:cell.imageView.tag ] intValue];
   NSLog(@"tag test: %d", choose_l_or_r );
    cell.imageView.tag=indexPath.row*2;
    cell.imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(testclick:)];
    [cell.imageView addGestureRecognizer:singleTap];
    
 
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger num=[imageArray count]/2;
    if ([imageArray count]%2 !=0 ){
        num = num+1;
    }
    return num;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.00f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 135.00f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init ];
    myView.backgroundColor = [UIColor clearColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 90, 22)];
    titleLabel.textColor=[UIColor blackColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text=[titleArray objectAtIndex:section];
    [myView addSubview:titleLabel];
//    [titleLabel release];
    return myView;
}
//点击效果，无
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
- (IBAction)testclick:(UITapGestureRecognizer *)sender
{
//    动态获取IMageView的数据，每个响应的数据不一样
//  EduAppDelegate *appDelegate = (EduAppDelegate *) [[UIApplication sharedApplication] delegate];
//
////  [[self navigationController] pushViewController:targetController animated:YES];
    NSLog(@"aaaaa: %d", [sender view].tag );
    NSLog(@"bbbb: %d", imageArray.count );
    if ([sender view].tag+1 == imageArray.count) {
        [self performSegueWithIdentifier:@"createAlbum" sender:[sender view]];
    }else{
        [self performSegueWithIdentifier:@"showAlbumImage" sender:[sender view]];
    }
    
  
}
-(void)prepareForSegue:(UIStoryboardSegue*) segue sender:(UIImageView *)sender
{
//    UIImageView *imageView=(UIImageView *)sender;
    NSLog(@"didSelectView: %d", sender.tag );
    if([[segue identifier] isEqualToString:@"showAlbumImage"]){
         AlbumImageViewController *detailsVC = [segue destinationViewController];
    }
}
@end
