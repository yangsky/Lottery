//
//  LSettingItem.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSettingItem : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;  //cell的样式
@property (nonatomic,copy) void (^operation)();

+(id)itemWithIcon:(NSString *)icon title:(NSString *)title;
+(id)itemWithTitle:(NSString *)title;
@end
