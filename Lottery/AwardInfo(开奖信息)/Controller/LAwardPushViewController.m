//
//  LAwardPushViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-27.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LAwardPushViewController.h"

@interface LAwardPushViewController ()

@end

@implementation LAwardPushViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    // 1.1.双色球
    LSettingSwitchItem *ball = [LSettingSwitchItem itemWithIcon:nil title:@"双色球"];
    ball.key = ILSettingAwardPushSSQ;
    
    // 1.2.大乐透
    LSettingSwitchItem *letou = [LSettingSwitchItem itemWithIcon:nil title:@"大乐透"];
    letou.key = ILSettingAwardPushDLT;
    
    LSettingGroup *group = [[LSettingGroup alloc]init];
    group.header = @"打开设置即可在开奖后立即收到推送消息，获知开奖号码";
    group.items = @[ball,letou];
    [_allGroups addObject:group];
    
}

@end
