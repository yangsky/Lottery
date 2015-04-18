//
//  LSettingItemController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LSettingItemController.h"
#import "LSettingPushNoticeViewController.h"
#import "LShareViewController.h"
#import "LHelpViewController.h"
#import "LAboutViewController.h"
#import "LProductCollectionViewController.h"

@interface LSettingItemController ()
@end

@implementation LSettingItemController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.add0Items;
    
    self.add1Items;
    
}

-(void)add0Items
{
    //第0组，3个
    //1.1
    LSettingArrowItem *push = [LSettingArrowItem itemWithIcon:@"MorePush" title:@"推送和提醒"];
    push.showVCClass = [LSettingPushNoticeViewController class];

    //1.2
    LSettingSwitchItem *shake = [LSettingSwitchItem itemWithIcon:@"handShake" title:@"摇一摇机选"];
    shake.key = ILSettingShakeChoose;

    //1.3
    LSettingSwitchItem *sound = [LSettingSwitchItem itemWithIcon:@"sound_Effect" title:@"声音效果"];
    sound.key = ILSettingSoundEffect;

    LSettingGroup *group = [[LSettingGroup alloc]init];
    group.header = @"基本设置";
    group.items = @[push, shake, sound];
    [_allGroups addObject:group];
    
}

-(void)add1Items
{
    //第1组，6个
    //2.1
    LSettingArrowItem *update = [LSettingArrowItem itemWithIcon:@"MoreUpdate" title:@"检查新版本"];
    update.operation = ^{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"版本更新" message:@"暂时无更新" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
        [alert show];
    };

    //2.2
    LSettingArrowItem *help = [LSettingArrowItem itemWithIcon:@"MoreHelp" title:@"帮助" ];
    help.showVCClass = [LHelpViewController class];
    
    //2.3
    LSettingArrowItem *share = [LSettingArrowItem itemWithIcon:@"MoreShare" title:@"分享"];
    share.showVCClass = [LShareViewController class];
    
    //2.4
    LSettingArrowItem *inform = [LSettingArrowItem itemWithIcon:@"MoreMessage" title:@"消息" ];
    
    //2.5
    LSettingArrowItem *product = [LSettingArrowItem itemWithIcon:@"MoreNetease" title:@"更多产品"];
    product.showVCClass = [LProductCollectionViewController class];
    
    //2.6
    LSettingArrowItem *about = [LSettingArrowItem itemWithIcon:@"MoreAbout" title:@"关于"];
    about.showVCClass = [LAboutViewController class];
    
    LSettingGroup *group = [[LSettingGroup alloc]init];
    group.header = @"高级设置";
    group.footer = @"这是高级设置";
    group.items = @[update,help,share,inform,product,about];
    
    [_allGroups addObject:group];

}



@end
