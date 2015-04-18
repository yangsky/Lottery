//
//  ILCircleView.h
//  01-ItcastLottery
//
//  Created by apple on 13-12-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//  幸运转盘(背景层、顶部的开始按钮)

#import <UIKit/UIKit.h>
@class ILCircleView;

typedef enum {
    ILCircleViewTypeAstrology, // 星座
    ILCircleViewTypeAnimal // 生效
}ILCircleViewType;

@protocol ILCircleViewDelegate <NSObject>

@optional
- (void)circleView:(ILCircleView *)circleView willRoateToIndex:(NSUInteger)index;
- (void)circleView:(ILCircleView *)circleView didRoateToIndex:(NSUInteger)index;
@end


@interface ILCircleView : UIView
+ (instancetype)circleView;

@property (nonatomic, assign) ILCircleViewType circleType;
@property (nonatomic, weak) id<ILCircleViewDelegate> delegate;

- (void)startRotate;
- (void)stopRotate;
- (void)pauseRotate;

@end
