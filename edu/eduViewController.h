//
//  eduViewController.h
//  edu
//
//  Created by lubing on 13-3-24.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EduViewController : UIViewController
@property(nonatomic,strong) IBOutlet UIView *loginView;
@property(nonatomic,strong) IBOutlet UITextField *loginNameView;
@property(nonatomic,strong) IBOutlet UITextField *loginPwdView;
- (IBAction)click:(id)sender;
- (IBAction)textFiledNextEditing:(id)sender;
- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
