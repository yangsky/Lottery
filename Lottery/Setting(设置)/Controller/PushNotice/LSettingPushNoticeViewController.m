
//  LSettingPushViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-27.
//  Created by Yang Shengyuan on 15-2-14.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LSettingPushNoticeViewController.h"
#import "LAwardAnimViewController.h"
#import "LBuyTimedNoticeViewController.h"
#import "LScoreShowNoticeViewController.h"
#import "LAwardPushViewController.h"

@interface LSettingPushNoticeViewController ()

@end

@implementation LSettingPushNoticeViewController

 -(void)viewDidLoad {
    [super viewDidLoad];

    self.title =@"推送和提醒";

    // Do any additional setup after loading the view.
     LSettingArrowItem *item1 = [LSettingArrowItem itemWithIcon:nil title:@"开奖号码推送"];
     item1.showVCClass = [LAwardPushViewController class];

     LSettingArrowItem *item2 = [LSettingArrowItem itemWithIcon:nil title:@"中奖动画"];
     item2.showVCClass = [LAwardAnimViewController class];
    

     LSettingArrowItem *item3 = [LSettingArrowItem itemWithIcon:nil title:@"比分直播提醒"];
     item3.showVCClass = [LScoreShowNoticeViewController class];

     LSettingArrowItem *item4 = [LSettingArrowItem itemWithIcon:nil title:@"购彩定时提醒"];
     item4.showVCClass = [LBuyTimedNoticeViewController class];

     LSettingGroup *group = [[LSettingGroup alloc]init];

     group.items = @[item1,item2,item3,item4];



     [_allGroups addObject:group];
    
}

@end
