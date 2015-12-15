//
//  WjlPhotoView.m
//  hartPay(哈特支付)
//
//  Created by mac on 15/11/30.
//  Copyright © 2015年 jinbi. All rights reserved.
//

#import "WjlPhotoView.h"
#import "UIView+WjlGestCate.h"

@interface WjlPhotoView()

@property (weak, nonatomic) IBOutlet UIImageView *iconImgvView;

@property (weak, nonatomic) IBOutlet UIButton *iconFrame;

@property(strong,nonatomic)UIImage *cutimg;
@end

@implementation WjlPhotoView


- (instancetype)init{
    if (self = [super init]) {
        NSArray *arr = [[NSBundle mainBundle]loadNibNamed:@"photo" owner:nil options:nil];
        self = [arr lastObject];
        [self addPan];
        [_iconImgvView addPinch];//添加捏合手势
        [_iconImgvView addPan];//添加拖拽手势
    }
    return self;
}
//取消
- (IBAction)cancel:(UIButton *)sender {
    [self removeFromSuperview];    
}
//保存
- (IBAction)save:(UIButton *)sender {
    //开启上下文
    UIGraphicsBeginImageContext(self.bounds.size);
    //获取上下文
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    //渲染
    [self.layer renderInContext:ctx];
    //获取截图
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    //获取截图范围
    CGRect rect =  _iconFrame.frame;
    CGRect cutrect = CGRectMake(rect.origin.x+20, rect.origin.y+20, rect.size.width-40, rect.size.height-40);
    UIImage *cutImg = [UIImage imageWithCGImage:CGImageCreateWithImageInRect(img.CGImage, cutrect)];
    //block
    _photoBlock(cutImg);

    [self removeFromSuperview];
}

- (void)setIcon:(UIImage *)icon{
    _icon = icon;
    _iconImgvView.image = icon;
}


@end
