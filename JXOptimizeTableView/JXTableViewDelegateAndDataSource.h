//
//  JXTableViewDelegateAndDataSource.h
//  JXOptimizeTableView
//
//  Created by 王加祥 on 16/7/1.
//  Copyright © 2016年 Wangjiaxiang. All rights reserved.
//  为UITableViewController瘦身，协议还有代理方法分开写


#import <UIKit/UIKit.h>

typedef void (^selectCell) (NSIndexPath *indexPath);

/** 代理对象(UITableView的协议需要声明在.h文件中 */
@interface JXTableViewDelegateAndDataSource : NSObject<UITableViewDelegate,UITableViewDataSource>


/**
 *  创建代理对象实例，并将数据列表传进去,代理对象将消息传递出去，是通过block的方式向外传递消息的
 *
 *  @param dataList    传进来的数组模型
 *  @param selectBlock 选中的时候的block
 *
 *  @return 实例化对象
 */
+ (instancetype)createTableViewDelegateWithDataList:(NSArray *)dataList selectBlock:(selectCell)selectBlock;

@end
