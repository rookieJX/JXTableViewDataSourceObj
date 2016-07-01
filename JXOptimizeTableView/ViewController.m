//
//  ViewController.m
//  JXOptimizeTableView
//
//  Created by 王加祥 on 16/7/1.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "ViewController.h"
#import "JXTableViewDelegateAndDataSource.h"


@interface ViewController ()
/** 模型数组 */
@property (nonatomic,strong) NSArray * dataList;
/** 数据源代理方法 */
@property (nonatomic,strong) JXTableViewDelegateAndDataSource * obj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataList = @[@"Tom",@"Jack",@"Lucy",@"Fuck"];
    
    JXTableViewDelegateAndDataSource * obj = [JXTableViewDelegateAndDataSource createTableViewDelegateWithDataList:self.dataList selectBlock:^(NSIndexPath *indexPath) {
         NSLog(@"点击了%ld行cell", (long)indexPath.row);
    }];
    
    // 这里必须使用强引用引用，不然会死掉
    self.obj = obj;
    
    self.tableView.delegate = self.obj;
    self.tableView.dataSource = self.obj;
}

@end
