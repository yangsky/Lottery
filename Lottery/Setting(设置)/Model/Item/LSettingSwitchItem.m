//
//  LSettingSwitchItem.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LSettingSwitchItem.h"

@implementation LSettingSwitchItem

-(void)setOff:(BOOL)off
{
    _off = off;
    [LSettingTool setBool:off forKey:self.key];
}

-(void)setKeys:(NSString *)key
{
    [super setKey:key];
    _off = [LSettingTool boolForKey:key];
}

@end
