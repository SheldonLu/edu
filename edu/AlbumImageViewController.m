//
//  AlbumImageViewController.m
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import "AlbumImageViewController.h"
#import "PinterestCell.h"
@interface AlbumImageViewController ()

@end

@implementation AlbumImageViewController


- (void)viewDidLoad
{
  
    [super viewDidLoad];
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:self.collectionView];
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.collectionView.numColsPortrait = 2;
    self.collectionView.numColsLandscape = 3;
    
    UILabel *loadingLabel = [[UILabel alloc] initWithFrame:self.collectionView.bounds];
    loadingLabel.text = @"Loading...";
    loadingLabel.textAlignment = UITextAlignmentCenter;
    self.collectionView.loadingView = loadingLabel;
    
    [self loadDataSource];
}
- (void)loadDataSource {
    // Request
    NSString *URLPath = [NSString stringWithFormat:@"http://imgur.com/gallery.json"];
    NSURL *URL = [NSURL URLWithString:URLPath];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        NSInteger responseCode = [(NSHTTPURLResponse *)response statusCode];
        
        if (!error && responseCode == 200) {
            id res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (res && [res isKindOfClass:[NSDictionary class]]) {
                self.items = [res objectForKey:@"data"];
                [self dataSourceDidLoad];
            } else {
                [self dataSourceDidError];
            }
        } else {
            [self dataSourceDidError];
        }
    }];
}
- (void)dataSourceDidLoad {
    [self.collectionView reloadData];
}

- (void)dataSourceDidError {
    [self.collectionView reloadData];
}

#pragma mark - PSCollectionViewDelegate and DataSource
- (NSInteger)numberOfViewsInCollectionView:(PSCollectionView *)collectionView {
    return [self.items count];
}

- (CGFloat)heightForViewAtIndex:(NSInteger)index {
    NSDictionary *item = [self.items objectAtIndex:index];
    
    return [PinterestCell heightForViewWithObject:item inColumnWidth:self.collectionView.colWidth];
}

- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView viewAtIndex:(NSInteger)index {
    
    PinterestCell *cell = (PinterestCell *)[self.collectionView dequeueReusableView];
    if (!cell) {
        cell = [[PinterestCell alloc] initWithFrame:CGRectZero];
    }
    
    [cell fillViewWithObject:self.items[index]];
    
    return cell;
}


- (void)collectionView:(PSCollectionView *)collectionView didSelectView:(PSCollectionViewCell *)view atIndex:(NSInteger)index {
    NSLog(@"didSelectView: %d", index);
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
