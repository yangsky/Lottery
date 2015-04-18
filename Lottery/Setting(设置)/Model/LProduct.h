//
//  LProduct.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LProduct : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *icon;

+ (id)productWithDict:(NSDictionary *)dict;
@end
