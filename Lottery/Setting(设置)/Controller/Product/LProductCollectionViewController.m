//
//  LProductCollectionViewController.m
//  Lottery
//
//  Created by Yang Shengyuan on 15-3-8.
//  Copyright (c) 2015年 Yang Shengyuan. All rights reserved.
//

#import "LProductCollectionViewController.h"
#import "LProduct.h"
#import "LProductCell.h"

NSString * const ILId = @"cell";

@interface LProductCollectionViewController ()
{
    NSMutableArray *_products;
}
@end

@implementation LProductCollectionViewController


-(id)init {
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置每一个各自的大小
    flow.itemSize = CGSizeMake(80, 80);
    
    // 水平方向上的间距 == 0
    flow.minimumInteritemSpacing = 0;
    
    // 垂直方向上的间距 ==
    //    flow.minimumLineSpacing = 40;
    
    flow.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    return [self initWithCollectionViewLayout:flow];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"其他产品推荐";
    
    // 1.加载JSON
    NSArray *array = ILJson(product.json);
    
    // 2.创建产品模型
    _products = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        LProduct *p = [LProduct productWithDict:dict];
        [_products addObject:p];
    }
    
    // 3.注册
    UINib *nib = [UINib nibWithNibName:[LProductCell xib] bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ILId];
    self.collectionView.backgroundColor = ILGlobalBg;
}


#pragma mark <UICollectionViewDataSource>


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _products.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ILId forIndexPath:indexPath];
    
    cell.product = _products[indexPath.item];
    
    return cell;
}
@end
