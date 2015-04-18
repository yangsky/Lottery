//
//  LHtmlPage.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-11.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LHtmlPage.h"

@implementation LHtmlPage
+ (id)htmlPageWithDict:(NSDictionary *)dict{
    LHtmlPage *hp = [[self alloc]init];
    
    hp.title = dict[@"title"];
    hp.html = dict[@"html"];
    hp.ID = dict[@"id"];
    
    return hp;
    
}

@end
