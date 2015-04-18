//
//  LTabBar.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-20.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTabBar;

@protocol LTabBarDelegate <NSObject>

@optional
-(void)tabBar:(LTabBar *)tabBar didSelectedFrom:(NSInteger)from to:(NSInteger)to;

@end

@interface LTabBar : UIView
-(void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon;

@property (nonatomic,weak) id<LTabBarDelegate> delegate;

@end
