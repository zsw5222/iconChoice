//
//  WjlPhotoView.h
//  hartPay(哈特支付)
//
//  Created by mac on 15/11/30.
//  Copyright © 2015年 jinbi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WjlPhotoViewBlock)(UIImage *img);

@interface WjlPhotoView : UIView

@property(nonatomic,weak)UIImage *icon;

@property(nonatomic,copy)WjlPhotoViewBlock photoBlock;
 
@end
