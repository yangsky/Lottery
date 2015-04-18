//
//  LAboutHeaderView.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-9.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LAboutHeaderView.h"

@implementation LAboutHeaderView

+ (id)headerView
{
    return [[NSBundle mainBundle] loadNibNamed:@"LAboutHeaderView" owner:nil options:nil][0];
}

@end
