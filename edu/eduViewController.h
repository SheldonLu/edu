//
//  eduViewController.h
//  edu
//
//  Created by lubing on 13-3-24.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define StateBarHeight 20
#define MainHeight (ScreenHeight - StateBarHeight)
#define MainWidth ScreenWidth
@class TPKeyboardAvoidingScrollView;

@interface EduViewController : UIViewController <UITextFieldDelegate>{
    Boolean isLogin;
    Boolean isRemember;
}
@property (nonatomic, strong) IBOutlet TPKeyboardAvoidingScrollView *scrollView;
//@property(nonatomic,strong) IBOutlet UIView *loginView;
@property(nonatomic,strong) IBOutlet UITextField *loginNameView;
@property(nonatomic,strong) IBOutlet UITextField *loginPwdView;
@property(nonatomic,strong) IBOutlet UIButton *loginButton;
@property(nonatomic,strong) IBOutlet UIButton *autoLogin;
@property(nonatomic,strong) IBOutlet UIButton *rememberPwd;

- (IBAction)rememberclick:(id)sender;
- (IBAction)autoLoginclick:(id)sender;
- (IBAction)click:(id)sender;
- (IBAction)textFiledNextEditing:(id)sender;
- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

@end
