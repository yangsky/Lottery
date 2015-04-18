//
//  LAboutViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LAboutViewController.h"
#import "LAboutHeaderView.h"

@interface LAboutViewController ()

@end

@implementation LAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    
    // 1.1 评分支持
    LSettingArrowItem *mark = [LSettingArrowItem itemWithTitle:@"评分支持"];
    
    // 1.2 客服电话
    LSettingArrowItem *phone = [LSettingArrowItem itemWithTitle:@"客服电话"];
    phone.subtitle = @"020-83568090";
    
    LSettingGroup *group = [[LSettingGroup alloc] init];
    group.items = @[mark, phone];
    [_allGroups addObject:group];
    
    // 2.设置表格的头部控件
    self.tableView.tableHeaderView = [LAboutHeaderView headerView];

        self.tableView.scrollEnabled = YES;
}



@end
