//
//  LLuckyNumViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-20.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LLuckyNumViewController.h"
#include "ILCircleBgView.h"
#import "ILCircleView.h"
#import "ThreeButton.h"

@interface LLuckyNumViewController ()
{
    ThreeButton *_threeButton;
    ILCircleView *_circle;
}
@end

@implementation LLuckyNumViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加一个全屏的背景
    [self setupBg];
    
    // 2.添加3个选择按钮
    [self setupThreeBtn];
    
    // 2.添加转盘
    [self setupCircle];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_circle pauseRotate];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_circle startRotate];
}

#pragma mark 添加转盘
- (void)setupCircle
{
    ILCircleView *circle = [ILCircleView circleView];
    circle.delegate = self;
    circle.circleType = ILCircleViewTypeAstrology;
    CGFloat cx = _threeButton.center.x;
    CGFloat cy = CGRectGetMaxY(_threeButton.frame) + circle.frame.size.height * 0.5;
    
    
    
    if (!is4inch) { // 3.5inch屏幕，往上移动10个点
        cy -= 20;
    }
    
    circle.center = CGPointMake(cx, cy);
    [self.view addSubview:circle];
    _circle = circle;
}

#pragma mark 添加3个选择按钮
- (void)setupThreeBtn
{
    ThreeButton *tb = [ThreeButton threeButton];
    CGFloat cx = self.view.frame.size.width * 0.5;
    CGFloat cy = tb.frame.size.height * 0.5 + 20;
    tb.center = CGPointMake(cx, cy);
    [self.view addSubview:tb];
    _threeButton = tb;
}

#pragma mark 添加一个全屏的背景
- (void)setupBg
{
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:is4inch?@"LuckyBackground-568h@2x.jpg":@"LuckyBackground@2x.jpg"];
    bg.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:bg];
}

#pragma mark - 转盘的代理方法
- (void)circleView:(ILCircleView *)circleView didRoateToIndex:(NSUInteger)index
{
    //    ILLog(@"快速转到了哪个生肖---%d", index);
    NSLog(@"快速转到了哪个生肖---%d", index);
}

- (void)circleView:(ILCircleView *)circleView willRoateToIndex:(NSUInteger)index
{
    //    ILLog(@"即将转到了哪个生肖---%d", index);
    NSLog(@"即将转到了哪个生肖---%d", index);
}

@end
