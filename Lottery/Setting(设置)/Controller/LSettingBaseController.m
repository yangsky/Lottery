//
//  LSettingBaseController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-1-22.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LSettingBaseController.h"
#import "LSettingCell.h"

const int ILCellSectionHeaderH = 40;

@interface LSettingBaseController ()

@end

@implementation LSettingBaseController

@synthesize tableView = _tableView;

-(void)loadView{
    _allGroups = [NSMutableArray array];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 设置背景
    tableView.backgroundView = nil;
    tableView.backgroundColor = ILGlobalBg;
    
    // group状态下，sectionFooterHeight和sectionHeaderHeight是有值的
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = ILCellSectionHeaderH;
    
    // 在tableView初始化的时候设置contentInset
    // 在tableView展示完数据的时候给contentInset.top增加64的值
    if (iOS7) {
        tableView.contentInset = UIEdgeInsetsMake(ILCellSectionHeaderH - 50, 0, 0, 0);
    }
    
    // 隐藏分隔线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.view = tableView;
    
    
    _tableView = tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return _allGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    LSettingGroup *group = _allGroups[section];
    return group.items.count;
    
}

//每当一个cell进入到视野范围内调用该方法  与android中的listview类似
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LSettingCell *cell = [LSettingCell settingCellWithTableView:tableView];
    
    LSettingGroup *group = _allGroups[indexPath.section];
    
    cell.item = group.items[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //去除选中时的背景
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //取出这行对应的模型
    LSettingGroup *group = _allGroups[indexPath.section];
    
    LSettingItem *item = group.items[indexPath.row];
    
    //取出这行对应模型的代码
    if (item.operation) {
        item.operation();
    }
    
    //检测有没有跳转的控制器
    if ([item isKindOfClass:[LSettingArrowItem class]]) {
        LSettingArrowItem *arrowItem = (LSettingArrowItem *)item;
        if (arrowItem.showVCClass) {
            UIViewController *vc = [[arrowItem.showVCClass alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    LSettingGroup *group = _allGroups[section];
    return group.footer;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    LSettingGroup *group = _allGroups[section];
    return group.header;
}

@end
