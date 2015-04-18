//
//  LBuyTimedNoticeViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LBuyTimedNoticeViewController.h"

@interface LBuyTimedNoticeViewController ()

@end

@implementation LBuyTimedNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提醒设置";
    
    LSettingSwitchItem *notice = [LSettingSwitchItem itemWithTitle:@"打开提醒"];
    notice.key = ILSettingBuyTimedNotice;
    
    LSettingGroup *group = [[LSettingGroup alloc] init];
    group.items = @[notice];
    group.header = @"您可以通过设置，提醒自己在开奖日不要忘了购买彩票";
    [_allGroups addObject:group];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
