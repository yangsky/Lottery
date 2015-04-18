//
//  LShareViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LShareViewController.h"

@interface LShareViewController ()

@end

@implementation LShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"分享设置";
    
    // 1.1.新浪微博
    LSettingArrowItem *weibo = [LSettingArrowItem itemWithIcon:@"WeiboSina" title:@"新浪微博"];
    
    // 1.2.短信分享
    LSettingArrowItem *sms = [LSettingArrowItem itemWithIcon:@"SmsShare" title:@"短信分享"];
    
    // 1.3.邮件分享
    LSettingArrowItem *mail = [LSettingArrowItem itemWithIcon:@"MailShare" title:@"邮件分享"];
    
    LSettingGroup *group = [[LSettingGroup alloc] init];
    group.items = @[weibo, sms, mail];
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
