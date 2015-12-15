//
//  ViewController.m
//  chooseIcon
//
//  Created by wjl on 15/12/14.
//  Copyright © 2015年 wjl. All rights reserved.
//

#import "ViewController.h"
#import "WjlTool.h"
#import "WjlPhotoView.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iconImgView;


@end

@implementation ViewController
- (IBAction)choseIcon:(id)sender {
    [self chooseIcon];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}
#pragma mark - 选择头像
- (void)chooseIcon{
    
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhotoCamera];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self takePhotoLiabray];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alter addAction:action1];
    [alter addAction:action2];
    [alter addAction:action3];
    [self presentViewController:alter animated:YES completion:nil];
    
}

#pragma mark - 拍照传头像
- (void)takePhotoCamera{
    //如果摄像头不可用
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [WjlTool tipAtlerInCtr:self withMessage:@"摄像头不可用" andCancelMsg:@"确定"];
    }else{
        UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
        
        cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        cameraUI.allowsEditing = NO;
        
        cameraUI.delegate = self;
        
        [self presentViewController:cameraUI animated:YES completion:nil];
    }
}

#pragma mark - 相册选择头像
- (void)takePhotoLiabray{
    //    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
    UIImagePickerController *pick = [[UIImagePickerController alloc]init];
    pick.delegate = self;
    pick.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pick animated:YES completion:nil];
    //    }else{
    //        [WjlTool tipAtlerInCtr:self withMessage:@"相册不可用" andCancelMsg:@"确定"];
    //    }
    
}
#pragma mark - imagePickerController代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {//摄像头拍摄的图片
        
        UIImage *photo = info[UIImagePickerControllerOriginalImage];
        _iconImgView.image = photo;
        [picker dismissViewControllerAnimated:YES completion:^{
            [WjlTool tipAtlerInCtr:self withMessage:@"头像修改成功"andCancelMsg:@"确定"];
        }];
        
    }else{//相册中选择的图片
        WjlPhotoView *photoV = [[WjlPhotoView alloc]init];
        photoV.frame =  picker.view.frame;
        photoV.icon = info[UIImagePickerControllerOriginalImage];
        [picker.view addSubview:photoV];
        //block 回调
        photoV.photoBlock = ^(UIImage*img){
            self.iconImgView.image = img;
            [picker dismissViewControllerAnimated:YES completion:^{
                [WjlTool tipAtlerInCtr:self withMessage:@"头像修改成功"andCancelMsg:@"确定"];
            }];
        };
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}



@end
