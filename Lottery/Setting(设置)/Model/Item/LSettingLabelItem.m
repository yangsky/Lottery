//
//  LSettingLabelItem.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LSettingLabelItem.h"

@implementation LSettingLabelItem
- (void)setText:(NSString *)text
{
    _text = text;
    
    // 归档
    [LSettingTool setObject:text forKey:self.key];
}

- (void)setKey:(NSString *)key
{
    [super setKey:key];
    
    _text = [LSettingTool objectForKey:key];
}
@end
