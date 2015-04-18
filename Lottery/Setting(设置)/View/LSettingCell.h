//
//  LSettingCell.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LSettingItem;
@interface LSettingCell : UITableViewCell
@property (nonatomic,strong) LSettingItem *item;
@property (nonatomic, strong) NSIndexPath *indexPath;

+(id)settingCellWithTableView:(UITableView *)tableView;
@end
