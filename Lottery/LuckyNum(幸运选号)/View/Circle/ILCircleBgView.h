//
//  ILCircleBgView.h
//  01-ItcastLottery
//
//  Created by apple on 13-12-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  背景层(3层：最底部图片、中间转盘图片、顶部的星座小图片)

#import <UIKit/UIKit.h>
@class LCircleItemView;

extern const int ILCircleWH;

@interface ILCircleBgView : UIView
+ (instancetype)circleBgView;

//设置选中的图片
-(void)setBg:(NSString *)normal selected:(NSString *)selected;

@property (nonatomic, readonly) LCircleItemView *selectedBtn;
@end
