//
//  LSettingKeys.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ILDefineConstStr(name) \
NSString * const name = @#name;

// 摇一摇机选
ILDefineConstStr(ILSettingShakeChoose)
// 声音效果
ILDefineConstStr(ILSettingSoundEffect)

// 开奖推送设置
// 双色球
ILDefineConstStr(ILSettingAwardPushSSQ)
// 大乐透
ILDefineConstStr(ILSettingAwardPushDLT)

// 中奖动画
ILDefineConstStr(ILSettingAwardAnim)

// 比分直播
// 提醒关注的比赛
ILDefineConstStr(ILSettingScoreShowNoticeCareGame)
// 起始时间
ILDefineConstStr(ILSettingScoreShowStartTime)
// 结束时间
ILDefineConstStr(ILSettingScoreShowEndTime)

// 购彩定时提醒
ILDefineConstStr(ILSettingBuyTimedNotice)