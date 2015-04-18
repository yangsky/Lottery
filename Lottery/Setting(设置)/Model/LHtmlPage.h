//
//  LHtmlPage.h
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-11.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LHtmlPage : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;

+ (id)htmlPageWithDict:(NSDictionary *)dict;

@end
