//
//  ILCircleView.m
//  01-ItcastLottery
//
//  Created by apple on 13-12-27.
//  Copyright (c) 2013年 itcast. All rights reserved.
//

#import "ILCircleView.h"
#import "ILCircleBgView.h"
#import "LCircleItemView.h"


// 1秒种转多少度
#define ILCircleRotateSpeedPerSecond (M_PI_4/2)
#define ILTransform2Angle(transform) atan2(transform.b, transform.a)

const int ILCircleWH = 286;
@interface ILCircleView ()
{
    ILCircleBgView *_bgView;
    CADisplayLink *_timer;
}
@end

@implementation ILCircleView
#pragma mark - 生命周期方法
+ (instancetype)circleView
{
    return [[self alloc] init];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor yellowColor];
        // 1.添加背景
        [self setupBg];
        
        // 2.添加开始按钮
        [self setupStartBtn];
    }
    return self;
}

-(void)setCircleType:(ILCircleViewType)circleType
{
    _circleType = circleType;
    if (_circleType == ILCircleViewTypeAstrology) {
        [_bgView setBg:@"LuckyAstrology" selected:@"LuckyAstrologyPressed"];
    } else {
        [_bgView setBg:@"LuckyAnimal" selected:@"LuckyAnimalPressed"];
    }
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

#pragma mark - 私有方法
#pragma mark 添加背景
- (void)setupBg
{
    ILCircleBgView *bgView = [ILCircleBgView circleBgView];
    [self addSubview:bgView];
    _bgView = bgView;
}

#pragma mark 添加开始按钮
- (void)setupStartBtn
{
    UIButton *startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startBtn.bounds = CGRectMake(0, 0, 81, 81);
    startBtn.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    [startBtn setBackgroundImage:[UIImage imageNamed:@"LuckyCenterButton"] forState:UIControlStateNormal];
    [startBtn setBackgroundImage:[UIImage imageNamed:@"LuckyCenterButtonPressed"] forState:UIControlStateHighlighted];
    [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:startBtn];
}

-(void)start
{
    //停止旋转
    [self stopRotate];
    //停止交互
    self.userInteractionEnabled = NO;
    //快速旋转
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    CGFloat angle = ILTransform2Angle(_bgView.selectedBtn.transform);
    anim.duration = 2.0;
    anim.toValue = @(M_PI * 20 - angle);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    
    [_bgView.layer addAnimation:anim forKey:nil];
    
    //通知代理
    if([_delegate respondsToSelector:@selector(circleView:willRoateToIndex:)])
    {
        [_delegate circleView:self willRoateToIndex:_bgView.selectedBtn.tag];
    }
    
}

#pragma mark 动画执行完毕后自动调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    self.userInteractionEnabled = YES;
    CGFloat angle = ILTransform2Angle(_bgView.selectedBtn.transform);
    _bgView.transform = CGAffineTransformMakeRotation(-angle);
    
    // 通知代理
    if ([_delegate respondsToSelector:@selector(circleView:didRoateToIndex:)]) {
        [_delegate circleView:self didRoateToIndex:_bgView.selectedBtn.tag];
    }
}

#pragma mark 在这个方法中开始慢慢转
- (void)startRotate
{
    // NSTimer只适合做频率比较低的事情
    // CADisplayLink适合做频率比较高的事情
    if (_timer.isPaused) {
        _timer.paused = NO;
    } else {
        [_timer invalidate];
        
        _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotating:)];
        [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
}

#pragma mark 正在旋转
// 1秒调用60次，1/60.0秒调用一次
- (void)rotating:(CADisplayLink *)timer
{
    //    CGAffineTransformMakeRotation(<#CGFloat angle#>)
    
    // 时间 * 速度 == 角度
    CGFloat angle = timer.duration * ILCircleRotateSpeedPerSecond;
    
    // 旋转一定的角度
    _bgView.transform = CGAffineTransformRotate(_bgView.transform, angle);
    
}

#pragma mark 在这个方法中暂停旋转
- (void)pauseRotate
{
    // 暂停
    _timer.paused = YES;
}

#pragma mark 在这个方法中停止旋转
- (void)stopRotate
{
    [_timer invalidate];
    _timer = nil;
}
@end
