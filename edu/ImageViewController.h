//
//  ImageViewController.h
//  edu
//
//  Created by lubing on 13-3-24.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) IBOutlet UITableView *imageTableView;
@property(nonatomic,weak)  UITableView *backgroundPicture;

- (IBAction)testclick:(id)sender;
@end
