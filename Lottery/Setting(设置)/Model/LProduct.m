//
//  LProduct.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LProduct.h"

@implementation LProduct
+ (id)productWithDict:(NSDictionary *)dict
{
    LProduct *p = [[self alloc] init];
    p.title = dict[@"title"];
    p.icon = dict[@"icon"];
    return p;
}
@end
