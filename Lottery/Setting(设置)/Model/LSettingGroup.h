//
//  LSettingGroup.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSettingGroup : NSObject
@property (nonatomic,copy) NSString *header;
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,strong) NSArray *items;
@end
