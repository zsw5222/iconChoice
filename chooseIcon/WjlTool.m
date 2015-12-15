//
//  WjlTool.m
//  hartPay(哈特支付)
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 jinbi. All rights reserved.
//

#import "WjlTool.h"

@implementation WjlTool

+(void)pushControllerFrom:(UIViewController *)viewcon toSBIntController:(NSString*)sbname{
 
        UIStoryboard *sb = [UIStoryboard storyboardWithName:sbname bundle:nil];
        UIViewController *con = sb.instantiateInitialViewController;
        [viewcon.navigationController pushViewController:con animated:YES];
   
}
+ (UIViewController*)getControllerWithInitSb:(NSString*)SbName{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:SbName bundle:nil];
    UIViewController *viewcontroller = sb.instantiateInitialViewController;
    return viewcontroller;
}

+(void)setBackItem:(UIViewController*)con{
    //设置导航条的返回按钮文本为“返回”
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
//    [back setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:0 green:138/255.0 blue:212/255.0 alpha:1]} forState:UIControlStateNormal];
    [con.navigationItem setBackBarButtonItem:back];
}
+(void)showAtlerInCtr:(UIViewController*)con withMessage:(NSString*)meg andCancelMsg:(NSString*)cmsg{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:meg
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:cmsg style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              if (con.navigationController != nil) {
                                                                  [con.navigationController popViewControllerAnimated:YES];
                                                              }else [con  dismissViewControllerAnimated:YES completion:nil];
                                                              
                                                          }];
    
    [alert addAction:defaultAction];
    [con presentViewController:alert animated:YES completion:nil];
}

+(void)tipAtlerInCtr:(UIViewController*)con withMessage:(NSString*)meg andCancelMsg:(NSString*)cmsg{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:meg
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:cmsg style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
                                                              
    [alert addAction:defaultAction];
    [con presentViewController:alert animated:YES completion:nil];
}

@end
