//
//  ThreeButton.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-24.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "ThreeButton.h"
@interface ThreeButton()

- (IBAction)selectCategory:(id)sender;

- (IBAction)selectType:(id)sender;

- (IBAction)selectCount:(id)sender;

@end


@implementation ThreeButton

+ (instancetype)threeButton
{
    return [[NSBundle mainBundle] loadNibNamed:@"ThreeButton" owner:nil options:nil][0];
}

- (IBAction)selectCategory:(id)sender {
}

- (IBAction)selectType:(id)sender {
}

- (IBAction)selectCount:(id)sender {
}
@end
