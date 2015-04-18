//
//  LSettingKeys.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#define ILDeclareConstStr(name) \
extern NSString *const name;

// extern声明一个变量(不是定义)
// 摇一摇机选
ILDeclareConstStr(ILSettingShakeChoose)
// 声音效果
ILDeclareConstStr(ILSettingSoundEffect)

// 开奖推送设置
// 双色球
ILDeclareConstStr(ILSettingAwardPushSSQ)
// 大乐透
ILDeclareConstStr(ILSettingAwardPushDLT)

// 中奖动画
ILDeclareConstStr(ILSettingAwardAnim)

// 比分直播
// 提醒关注的比赛
ILDeclareConstStr(ILSettingScoreShowNoticeCareGame)
// 起始时间
ILDeclareConstStr(ILSettingScoreShowStartTime)
// 结束时间
ILDeclareConstStr(ILSettingScoreShowEndTime)

// 购彩定时提醒
ILDeclareConstStr(ILSettingBuyTimedNotice)
