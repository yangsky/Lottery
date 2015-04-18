//
//  LNavigationBarController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LNavigationBarController.h"

@interface LNavigationBarController ()


@end

@implementation LNavigationBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//初始化，只进行一次
+(void)initialize
{
    //获取对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    UIBarButtonItem *navItem = [UIBarButtonItem appearance];
    
    
    
    NSString *navBag = nil;
    if (iOS7) { // iOS7
        navBag = @"NavBar64";
        
        // 设置导航栏的渐变色为白色（iOS8中返回箭头的颜色变为这个颜色：白色）
        navBar.tintColor = [UIColor whiteColor];
    } else { // 非iOS7
        navBag = @"NavBar";
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleBlackOpaque;
        
        // 设置导航栏按钮的背景图片
        [navItem setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [navItem setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        
        // 设置导航栏返回按钮的背景图片
        [navItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [navItem setBackButtonBackgroundImage:[UIImage imageNamed:@"NavBackButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
    
    
    
    //设置背景
    [navBar setBackgroundImage:[UIImage imageNamed:navBag] forBarMetrics:UIBarMetricsDefault];
    
    //设置导航栏字体颜色
    [navBar setTitleTextAttributes:@{
            UITextAttributeTextColor:[UIColor whiteColor]
            }
     ];
    
    //设置导航栏标题颜色
    [navItem setTitleTextAttributes:@{
                                      UITextAttributeTextColor:[UIColor whiteColor],
                                      UITextAttributeFont:[UIFont systemFontOfSize:13.0]
                                      }
                           forState:UIControlStateNormal];
    
}

#pragma mark 控制状态栏的样式
/*
 1、iOS7之前：UIApplicaion
 2、iOS7之后，交给对应的控制器去管理
 */
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
