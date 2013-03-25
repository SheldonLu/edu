//
//  AlbumImageViewController.m
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "AlbumImageViewController.h"

@interface AlbumImageViewController ()

@end

@implementation AlbumImageViewController
@synthesize collectionView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
  
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 选取图片
- (IBAction)getExistintPicture:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController *picker =
        [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        // 图片库
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentModalViewController:picker animated:YES];
        
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error accessing photo library"
                              message:@"Device does not support a photo library"
                              delegate:nil
                              cancelButtonTitle:@"Drat!"
                              otherButtonTitles:nil];
        [alert show];
    }
}

// 打开摄像头
- (IBAction)getCameraPicture:(id)sender {
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *picker =
        [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        // 摄像头
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentModalViewController:picker animated:YES];
    }else {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Error"
                              message:@"你没有摄像头"
                              delegate:nil
                              cancelButtonTitle:@"Drat!"
                              otherButtonTitles:nil];
        [alert show];
    }
    
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    self.label.text = @"";
    
    // 得到图片
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    // 获得照片详细信息
    NSDictionary *media = [info objectForKey:UIImagePickerControllerMediaMetadata];
//    if (media != nil) {
//        NSNumber *DPIHeight = [media objectForKey:@"DPIHeight"];
//        NSNumber *DPIWidth = [media objectForKey:@"DPIWidth"];
//        NSNumber *Orientation = [media objectForKey:@"Orientation"];
//        
//        NSDictionary *Exif = [media objectForKey:@"{Exif}"];
//        NSNumber *ColorSpace = [Exif objectForKey:@"ColorSpace"];
//        NSNumber *PixelYDimension = [Exif objectForKey:@"PixelYDimension"];
//        NSString *DateTimeOriginal = [Exif objectForKey:@"DateTimeOriginal"];
//        NSString *DateTimeDigitized = [Exif objectForKey:@"DateTimeDigitized"];
//        NSNumber *PixelXDimension = [Exif objectForKey:@"PixelXDimension"];
//        
//        NSDictionary *TIFF = [media objectForKey:@"{TIFF}"];
//        NSString *Make = [TIFF objectForKey:@"Make"];
//        NSString *Model = [TIFF objectForKey:@"Model"];
//        NSNumber *YResolution = [TIFF objectForKey:@"YResolution"];
//        NSString *DateTime = [TIFF objectForKey:@"DateTime"];
//        NSString *Software = [TIFF objectForKey:@"Software"];
//        NSNumber *XResolution = [TIFF objectForKey:@"XResolution"];
    
//        self.label.text = [NSString stringWithFormat:@"DPIHeight:%@ DPIWidth:%@ Orientation:%@\nColorSpace:%@ PixelXDimension:%@ PixelYDimension:%@ DateTimeOriginal:%@ DateTimeDigitized:%@\nMake:%@ Model:%@ XResolution:%@ YResolution:%@ DateTime:%@ Software:%@",
//                           DPIHeight, DPIWidth, Orientation,
//                           ColorSpace, PixelXDimension, PixelYDimension, DateTimeOriginal, DateTimeDigitized,
//                           Make, Model, XResolution, YResolution, DateTime, Software];
//    }
    
//    imageView.image = image;
    [picker dismissModalViewControllerAnimated:YES];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"开始上传"
                          message:@"请等待..."
                          delegate:nil
                          cancelButtonTitle:@"取消"
                          otherButtonTitles:nil];
    [alert show];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}
@end
