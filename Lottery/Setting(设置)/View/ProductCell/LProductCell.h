//
//  LProductCell.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LProduct;
@interface LProductCell : UICollectionViewCell
+ (NSString *)xib;

@property (nonatomic, strong) LProduct *product;
@end
