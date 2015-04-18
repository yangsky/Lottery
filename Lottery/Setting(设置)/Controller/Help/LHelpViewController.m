//
//  LHelpViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LHelpViewController.h"
#import "LHtmlPage.h"
#import "LHtmlViewController.h"
#import "LNavigationBarController.h"

@interface LHelpViewController ()
{
    NSMutableArray *_htmlPages;
}
@end

@implementation LHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"帮助";
    
    _htmlPages = [NSMutableArray array];
    
    NSURL *url = [[NSBundle mainBundle]URLForResource:@"help.json" withExtension:nil];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    
    NSMutableArray *items = [NSMutableArray array];
   
    for(NSDictionary *dict in array)
    {
        //1、创建网页模型
        LHtmlPage *hp = [LHtmlPage htmlPageWithDict:dict];
        [_htmlPages addObject:hp];
        
        //2、每一行cell对应的item
        LSettingArrowItem *arrow = [LSettingArrowItem itemWithTitle:hp.title];
        [items addObject:arrow];
    }
    
    //添加一组
    LSettingGroup *group = [[LSettingGroup alloc]init];
    group.items = items;
    [_allGroups addObject:group];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.跳到html控制器
    LHtmlViewController *htmlVc = [[LHtmlViewController alloc] init];
    htmlVc.htmlPage = _htmlPages[indexPath.row];
    
    LNavigationBarController *nav = [[LNavigationBarController alloc] initWithRootViewController:htmlVc];
    [self presentViewController:nav animated:YES completion:nil];
}

@end
