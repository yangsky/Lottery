//
//  LMineViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-20.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LMineViewController.h"

@interface LMineViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置背景
    self.view.backgroundColor = ILGlobalBg;
    
    // 2.登录按钮背景
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButton"] forState:UIControlStateNormal];
    [_loginBtn setBackgroundImage:[UIImage resizeImage:@"RedButtonPressed"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
