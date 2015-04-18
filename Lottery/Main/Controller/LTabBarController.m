//
//  LTabBarController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-20.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LTabBarController.h"
#import "LTabBar.h"
#import "UINavigationItem+IL.h"

@interface LTabBarController () <LTabBarDelegate>

@end

@implementation LTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (iOS7) {
        // 1.UIRectEdgeNone不要往四周边缘展开(按照非iOS7的传统来展示)
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        // 2.让所有的子控制器都不能展开
        for (UIViewController *vc in self.childViewControllers) {
            vc.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        // NO代表展开的时候不要包含那个条
        //        self.extendedLayoutIncludesOpaqueBars = NO;
    }
    
    // 自动会调用scrollView的contentInsets（比如group样式的tableView的insets.top=64）
    //    self.automaticallyAdjustsScrollViewInsets = YES;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        //1、删除默认的tabbar
        [self.tabBar removeFromSuperview];
        
        //2、创建新的tabBar
        LTabBar *myTabBar = [[LTabBar alloc]init];
        myTabBar.frame = self.tabBar.frame;
        myTabBar.delegate = self;
        [self.view addSubview:myTabBar];
        
        //添加按钮
        for (int i=1; i<=5; i++) {
            NSString *normal = [NSString stringWithFormat:@"TabBar%d",i];
            NSString *selected = [normal stringByAppendingString:@"Sel"];
            [myTabBar addTabBarButton:normal selIcon:selected];
        }
    });
}

#pragma mark TarBar代理方法
-(void)tabBar:(LTabBar *)tabBar didSelectedFrom:(NSInteger)from to:(NSInteger)to
{
    self.selectedIndex = to;
    UIViewController *newVC = self.viewControllers[to];
    
    //将新控制器的navigationItem的值转移给新的LTabBarItem
    [self.navigationItem copyFromItem:newVC.navigationItem];
}
@end
