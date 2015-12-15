//
//  UIView+WjlGestCate.m
//  hartPay(哈特支付)
//
//  Created by mac on 15/12/3.
//  Copyright © 2015年 jinbi. All rights reserved.
//

#import "UIView+WjlGestCate.h"

@implementation UIView (WjlGestCate)

- (void)addPinch{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    [self addGestureRecognizer:pinch];
    
}

- (void)pinch:(UIPinchGestureRecognizer *)pinch
{
    
    if (pinch.state == UIGestureRecognizerStateEnded ) {//结束是判断尺寸过大过小都还原
        if (( self.frame.size.width>[UIScreen mainScreen].bounds.size.width*1.4)||(                                                                                            self.frame.size.width<[UIScreen mainScreen].bounds.size.width*0.7)) {
            [UIView animateWithDuration:0.3 animations:^{
                self.transform = CGAffineTransformIdentity;
            }];
        }
    }else{
        self.transform = CGAffineTransformScale(self.transform, pinch.scale, pinch.scale);
    }
    //复位
    pinch.scale = 1.0;
}

//添加拖拽的手势
- (void)addPan{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveP:)];
    //    pan.minimumNumberOfTouches = 1;
    //    pan.maximumNumberOfTouches = 1;//只能一个手指操作
    [self  addGestureRecognizer:pan];
}
- (void)moveP:(UIPanGestureRecognizer*)pan{
    
    CGPoint translation = [pan translationInView:self];
    CGFloat centX = self.center.x+translation.x;
    CGFloat centY = self.center.y+translation.y;
    
    [UIView animateWithDuration:0 animations:^{
        
        self.center = CGPointMake(centX,centY);
    }];
    //位移归零
    [pan setTranslation:CGPointZero inView:self];
    
}
@end
