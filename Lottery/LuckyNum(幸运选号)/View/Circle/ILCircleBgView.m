//
//  ILCircleBgView.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

const int ILCircleWH = 286

#import "ILCircleBgView.h"
#include "LCircleItemView.h"

@implementation ILCircleBgView
#pragma mark - 生命周期方法
+ (instancetype)circleBgView
{
    return [[self alloc] init];
}

- (UIImage *)cutCircleBg
{
    UIImage *baseImage = [UIImage imageNamed:@"LuckyBaseBackground"];
    
    // Quartz2D
    // 核心对象：上下文（保存图片）
    // 1.开始上下文(NO == 透明, 0.0 == 默认做法)
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    
    // 2.获得当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 3.绘图裁剪
    // 3.1.画圆
    CGFloat innerCircleXY = 9;
    CGFloat innerCircleWH = ILCircleWH - innerCircleXY * 2;
    CGRect innerCircleRect = CGRectMake(innerCircleXY, innerCircleXY, innerCircleWH, innerCircleWH);
    CGContextAddEllipseInRect(ctx, innerCircleRect);
    
    // 3.2.裁剪（CGContextClip会把之前所画的剪下来）
    CGContextClip(ctx);
    
    // 3.3.画图片(这句代替后面的两句，可以免去坐标系转换的操作)
    [baseImage drawInRect:self.bounds];
//    CGContextDrawImage(ctx, self.bounds, baseImage.CGImage);
//    CGContextTranslateCTM(<#CGContextRef c#>, <#CGFloat tx#>, <#CGFloat ty#>)
    
    // 4.获得上下文中最终的图片
    UIImage *newBaseBg = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.结束上下文
    UIGraphicsEndImageContext();
    
    return newBaseBg;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setAllBtns];
        
    }
    return self;
}

-(void) setAllBtns
{
    for (int i=0; i<12; i++) {
        LCircleItemView *btn = [LCircleItemView buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        // 设置位置
        CGFloat posX = ILCircleWH * 0.5;
        CGFloat posY = posX;
        btn.layer.position = CGPointMake(posX, posY);
        // 旋转角度
        btn.transform = CGAffineTransformMakeRotation(M_PI / 6 * i);
        // 监听按钮点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        // 第0个默认选中
        if (i == 0) {
            [self btnClick:btn];
        }
    }
}


-(void)btnClick:(LCircleItemView *)btn
{
    _selectedBtn.selected = NO;
    btn.selected = YES;
    _selectedBtn = btn;
}
#pragma mark setFrame:和setBounds:能保证尺寸永远是286x286
- (void)setFrame:(CGRect)frame
{
    frame.size = CGSizeMake(ILCircleWH, ILCircleWH);
    [super setFrame:frame];
}

- (void)setBounds:(CGRect)bounds
{
    bounds.size = CGSizeMake(ILCircleWH, ILCircleWH);
    [super setBounds:bounds];
}

- (void)drawRect:(CGRect)rect
{
    // 1.画最底部的背景图
//    [[self cutCircleBg] drawInRect:rect];
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // copy一个ctx对象到栈中
    CGContextSaveGState(ctx);
    
    // 2.绘图裁剪
    // 2.1.画圆
    CGFloat innerCircleXY = 9;
    CGFloat innerCircleWH = ILCircleWH - innerCircleXY * 2;
    CGRect innerCircleRect = CGRectMake(innerCircleXY, innerCircleXY, innerCircleWH, innerCircleWH);
    CGContextAddEllipseInRect(ctx, innerCircleRect);
    
    // 3.2.裁剪（CGContextClip会把之前所画的剪下来）
    CGContextClip(ctx);
    [[UIImage imageNamed:@"LuckyBaseBackground"] drawInRect:rect];
    
    CGContextRestoreGState(ctx);
    
    // 4.画中间的转盘图
    [[UIImage imageNamed:@"LuckyRotateWheel"] drawInRect:rect];
    
//    [[UIColor redColor] set];
//    NSString *str = @"这是一个转盘";
//    [str drawAtPoint:CGPointZero withFont:[UIFont systemFontOfSize:30]];
}

@end
