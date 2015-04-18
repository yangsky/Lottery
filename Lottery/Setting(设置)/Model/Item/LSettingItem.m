//
//  LSettingItem.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LSettingItem.h"

@implementation LSettingItem

+(id)itemWithIcon:(NSString *)icon title:(NSString *)title
{
    LSettingItem *item = [[self alloc]init];
    item.icon = icon;
    item.title = title;
    return item;
}

+ (id)itemWithTitle:(NSString *)title
{
    return [self itemWithIcon:nil title:title];
}

@end
