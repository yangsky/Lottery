//
//  UINavigationItem+IL.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-3.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "UINavigationItem+IL.h"

@implementation UINavigationItem (IL)
- (void)copyFromItem:(UINavigationItem *)other
{
    self.leftBarButtonItem = other.leftBarButtonItem;
    self.leftBarButtonItems = other.leftBarButtonItems;
    self.rightBarButtonItem = other.rightBarButtonItem;
    self.rightBarButtonItems = other.rightBarButtonItems;
    self.titleView = other.titleView;
    self.title = other.title;
}
@end
