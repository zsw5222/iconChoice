//
//  WjlTool.h
//  hartPay(哈特支付)
//
//  Created by mac on 15/11/23.
//  Copyright © 2015年 jinbi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface WjlTool : NSObject
//从当前控制器push到另一个控制器（通过storyboard创建）
+(void)pushControllerFrom:(UIViewController *)viewcon toSBIntController:(NSString*)sbname;
//根据initialviewcontroller初始化一个控制器
+ (UIViewController*)getControllerWithInitSb:(NSString*)SbName;
    //设置导航条的返回按钮文本为“返回”
+(void)setBackItem:(UIViewController*)con;
//提示并退出当前控制器
+(void)showAtlerInCtr:(UIViewController*)con withMessage:(NSString*)meg andCancelMsg:(NSString*)cmsg;
//提示但不退出当前控制器
+(void)tipAtlerInCtr:(UIViewController*)con withMessage:(NSString*)meg andCancelMsg:(NSString*)cmsg;
@end
