//
//  AlbumImageViewController.h
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"

@interface AlbumImageViewController : UIViewController<PSCollectionViewDelegate, PSCollectionViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) PSCollectionView *collectionView;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *uploaderButton;

- (IBAction)getCameraPicture:(id)sender;
- (IBAction)getExistintPicture:(id)sender;
- (IBAction)showSheet:(id)sender;
@end
