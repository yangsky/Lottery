//
//  LSettingTool.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//
#define LUserDefaults [NSUserDefaults standardUserDefaults]
#import "LSettingTool.h"

@implementation LSettingTool

+ (id)objectForKey:(NSString *)defaultName
{
    return [LUserDefaults objectForKey:defaultName];
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName
{
    [LUserDefaults setObject:value forKey:defaultName];
    [LUserDefaults synchronize];
}

+ (BOOL)boolForKey:(NSString *)defaultName
{
    return [LUserDefaults boolForKey:defaultName];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    [LUserDefaults setBool:value forKey:defaultName];
    [LUserDefaults synchronize];
}

@end
