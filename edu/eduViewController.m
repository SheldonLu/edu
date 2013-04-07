//
//  eduViewController.m
//  edu
//
//  Created by lubing on 13-3-24.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "EduViewController.h"
#import "MainViewController.h"
#import "EduAppDelegate.h"
#import "SVProgressHUD.h"
#import "EduHTTPClient.h"
@interface EduViewController ()

@end

@implementation EduViewController
//@synthesize loginView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jz_02.png"]];
   // loginView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"jz_10.png"]];
    [self.loginNameView setText:@"wll"];
    [self.loginPwdView setText:@"sRYVHy>m6Tgx"];
    isRemember = false;
    isLogin = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginWithName:(NSString *)name password:(NSString *)password
{
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    if (name.length==0) {
        [SVProgressHUD dismissWithError:@"用户名不能为空" afterDelay:1];
        return ;
    }
    if(password.length==0){
        [SVProgressHUD dismissWithError:@"密码不能为空" afterDelay:1];
    }
    NSDictionary *loginFormDataDict = [NSDictionary dictionaryWithObjectsAndKeys:
                                       name, @"uname",
                                       password, @"pass",
                                       nil];
    [[EduHTTPClient sharedClient] performRequestWithPath:LOGIN formDataDic:loginFormDataDict withSuccessBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"%@",JSON);
        int errorCode = [[JSON objectForKey:@"ErrorCode"] intValue];
        if (errorCode == 0) {
            [SVProgressHUD dismissWithSuccess:@"登入成功" afterDelay:1];
            UIStoryboard *mainStoryBoard=[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
            MainViewController *mv=[mainStoryBoard instantiateViewControllerWithIdentifier:@"MainViewController"];
            mv.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
            mv.modalPresentationStyle=UIModalPresentationFormSheet;
            [self presentViewController:mv animated:YES completion:nil];
        }else{
            NSString *errorInfo =  [JSON objectForKey:@"ErrorInfo"];
            [SVProgressHUD dismissWithError:errorInfo afterDelay:1];
        }
       
    } failureBlock:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"%@",error);
//        [SVProgressHUD dismissWithError:@"系统内部错误，请联系管理员" afterDelay:1];
        [SVProgressHUD dismiss];
    }];
}
#pragma mark -记住密码和自动登陆事件
- (IBAction)rememberclick:(id)sender
{
//    self.rememberPwd.backgroundColor  = [UIColor clearColor];
    if(isRemember){
        [self.rememberPwd setBackgroundImage:[UIImage imageNamed:@"btn_check_off_disabled_holo_light.png"] forState:UIControlStateNormal];
        isRemember=false;
    }else{
        [self.rememberPwd setBackgroundImage:[UIImage imageNamed:@"btn_check_on_disabled_holo_light.png"] forState:UIControlStateNormal];
        isRemember=true;
    }

}
- (IBAction)autoLoginclick:(id)sender
{
    if(isLogin){
        [self.autoLogin setBackgroundImage:[UIImage imageNamed:@"btn_check_off_disabled_holo_light.png"] forState:UIControlStateNormal];
        isLogin=false;
    }else{
        [self.autoLogin setBackgroundImage:[UIImage imageNamed:@"btn_check_on_disabled_holo_light.png"] forState:UIControlStateNormal];
        isLogin=true;
    }
}
#pragma mark -跳转事件
- (IBAction)click:(id)sender
{
//    MainViewController*  mainViewC =  [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
//    [self presentModalViewController:mainViewC animated:YES];

    [self loginWithName:self.loginNameView.text password:self.loginPwdView.text];
}
#pragma mark -键盘事件
-(IBAction)textFiledNextEditing:(id)sender {
    [self.loginPwdView becomeFirstResponder];
}
-(IBAction)textFiledReturnEditing:(id)sender {
    [sender resignFirstResponder];
}
- (IBAction)backgroundTap:(id)sender {
    [self.loginNameView resignFirstResponder];
    [self.loginPwdView resignFirstResponder];
}



@end
