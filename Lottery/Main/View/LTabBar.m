//
//  LTabBar.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-20.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LTabBar.h"
#import "LTabBarButton.h"
@interface LTabBar()
{
    LTabBarButton *_selectedTabButton;
}

@end

@implementation LTabBar

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TabBarBack"]];
    }
    return self;
}

#pragma mark 添加一个按钮
-(void)addTabBarButton:(NSString *)icon selIcon:(NSString *)selIcon
{
    //创建button
    LTabBarButton *button = [LTabBarButton buttonWithType:UIButtonTypeCustom];
    
    //设置背景
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selIcon] forState:UIControlStateSelected];
    
    //设置按钮响应事件
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //添加
    [self addSubview:button];
    
    //重绘所有button的Frame
    [self adjustFrames];
    
    //默认选中第0个按钮
    button.tag = self.subviews.count - 1;
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
    
}

#pragma mark  设置所有控件的frames
-(void)adjustFrames
{
    int btnCount = self.subviews.count;
    for (int i=0; i<btnCount; i++) {
        LTabBarButton *button = self.subviews[i];
        
        //设置frame
        CGFloat buttonY = 0;
        CGFloat buttonW = self.frame.size.width / btnCount;
        CGFloat buttonX = i * buttonW;
        CGFloat buttonH = self.frame.size.height;
        
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
    }
}

#pragma mark 监听按钮响应事件
-(void)buttonClick:(UIButton *)button
{
    //通知代理
    if ([_delegate respondsToSelector:@selector(tabBar:didSelectedFrom:to:)]) {
        [_delegate tabBar:self didSelectedFrom:_selectedTabButton.tag to:button.tag];
    }
    
    //切换按钮状态
    _selectedTabButton.selected = NO;
    button.selected = YES;
    _selectedTabButton = button;
}

@end
