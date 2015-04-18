//
//  LAwardInfoTableViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-20.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LAwardInfoTableViewController.h"

@interface LAwardInfoTableViewController ()

@end

@implementation LAwardInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 20;
}

//每当一个cell进入到视野范围内调用该方法  与android中的listview类似
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";//static 一次初始化
    
    //1、根据标识先去缓冲池找对应的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    
    //2、如果缓冲池中没有才需要创建新的cell，并创建一个标识
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    //3、覆盖数据
    cell.textLabel.text = [NSString stringWithFormat:@"———————-%zd",indexPath.row];
    
    
    return cell;
}


@end
