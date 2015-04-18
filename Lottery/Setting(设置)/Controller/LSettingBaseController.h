//
//  LSettingBaseController.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSettingItem.h"
#import "LSettingGroup.h"
#import "LSettingArrowItem.h"
#import "LSettingSwitchItem.h"
#import "LSettingLabelItem.h"
#import "LSettingKeys.h"

@interface LSettingBaseController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_allGroups;
}
@property (nonatomic, weak, readonly) UITableView *tableView;

@end
