//
//  AlbumImageViewController.h
//  edu
//
//  Created by lubing on 13-3-25.
//  Copyright (c) 2013年 lubing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSCollectionView.h"

@interface AlbumImageViewController : UIViewController<PSCollectionViewDelegate, PSCollectionViewDataSource>
@property (nonatomic, retain) NSMutableArray *items;
@property (nonatomic, retain) PSCollectionView *collectionView;
@end
