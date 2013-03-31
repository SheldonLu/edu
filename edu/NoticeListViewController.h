//
//  NoticeListViewController.h
//  edu
//
//  Created by lubing on 13-3-29.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoticeListViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) IBOutlet UITableView *tableView;
@end
