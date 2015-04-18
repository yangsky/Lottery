//
//  LProductCell.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LProductCell.h"
#import "LProduct.h"
#import <QuartzCore/QuartzCore.h>
@interface LProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *productLabel;


@end

@implementation LProductCell

- (void)awakeFromNib {
    // Initialization code
    _iconView.layer.cornerRadius = 8;
    _iconView.layer.masksToBounds = YES;
}

+ (NSString *)xib
{
    return @"LProductCell";
}

-(void)setProduct:(LProduct *)product
{
    _product = product;
    
    _iconView.image = [UIImage imageNamed:product.icon];
    
    _productLabel.text = product.title;
    
}

@end
