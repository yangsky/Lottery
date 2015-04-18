//
//  LAwardAnimViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LAwardAnimViewController.h"

@interface LAwardAnimViewController ()

@end

@implementation LAwardAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"中奖动画";
    
    LSettingSwitchItem *anim = [LSettingSwitchItem itemWithTitle:self.title];
    anim.key = ILSettingAwardAnim;
    LSettingGroup *group = [[LSettingGroup alloc] init];
    group.header = @"当您有新中奖订单，启动程序时通过动画提醒您。为避免过于频繁，高频彩不会提醒。";
    group.items = @[anim];
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
