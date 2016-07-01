//
//  JXTableViewDelegateAndDataSource.m
//  JXOptimizeTableView
//
//  Created by 王加祥 on 16/7/1.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//

#import "JXTableViewDelegateAndDataSource.h"

@interface JXTableViewDelegateAndDataSource ()

@property (nonatomic, strong) NSArray   *dataList;
@property (nonatomic, copy)selectCell selectBlock;

@end

@implementation JXTableViewDelegateAndDataSource

+ (instancetype)createTableViewDelegateWithDataList:(NSArray *)dataList
                                        selectBlock:(selectCell)selectBlock {
    
    return [[[self class] alloc] initTableViewDelegateWithDataList:dataList                                                       selectBlock:selectBlock];
    
}

- (instancetype)initTableViewDelegateWithDataList:(NSArray *)dataList
                                      selectBlock:(selectCell)selectBlock {
    self = [super init];
    
    if (self) {
        self.dataList = dataList;
        self.selectBlock = selectBlock;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 将点击事件通过block的方式传递出去
    self.selectBlock(indexPath);
}
@end
