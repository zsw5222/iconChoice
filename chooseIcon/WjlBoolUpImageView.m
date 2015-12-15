//
//  WjlBoolUpImageView.m
//  hartPay(哈特支付)
//
//  Created by mac on 15/12/2.
//  Copyright © 2015年 jinbi. All rights reserved.
//

#import "WjlBoolUpImageView.h"
#import "UIView+WjlGestCate.h"

@interface WjlBoolUpImageView ()

@property(nonatomic,weak)UIView* backView;


@end

@implementation WjlBoolUpImageView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //
//    UITouch *touch = [touches anyObject];
    //点击的图片视图
//    UIImageView *imgview = (UIImageView*)touch.view;
    //原先的图片尺寸  xx
//    CGRect oringFrame = imgview.bounds;
    
    UIImage *img = self.image;
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //背景视图
    UIView *backView = [[UIView alloc]init];
    [backView setBackgroundColor:[UIColor blackColor]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(remove)];
    [backView addGestureRecognizer:tap];
    
    backView.frame = window.bounds;
    _backView = backView;
    
    //放大后的图片视图
    UIImageView *upImgView = [[UIImageView alloc]init];
    upImgView.image = img;
    upImgView.userInteractionEnabled = YES;
    [upImgView addPinch];
   
    CGFloat newHeight = [UIScreen mainScreen].bounds.size.width*self.frame.size.height/self.frame.size.width;
    upImgView.frame = CGRectMake(0,(backView.bounds.size.height - newHeight)/2.0 ,backView.bounds.size.width,newHeight);

    [backView addSubview:upImgView];
    [window addSubview:backView];
}
- (void)remove{
    [UIView animateWithDuration:0.3 animations:^{
         [_backView removeFromSuperview];
    }];
}

@end
