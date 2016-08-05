//
//  STProductTools.m
//  FMDBDemo
//
//  Created by leergou on 16/7/2.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import "STProductTools.h"
#import <FMDB.h>

static FMDatabase *_db;

@implementation STProductTools

#pragma mark - 0.在初始化该类的时候,创建数据库
// initialize load 方法
+ (void)initialize{
    
    //MARK: - 1.创建数据库
    // 1.DB - 指定路径
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"test.db"];
    
    // 2.创建 _db
    _db = [FMDatabase databaseWithPath:filePath];
    
    // 3.打开数据库
    if ([_db open]) {
        
        //MARK: - 2.建表
        NSString *sql = @"create table if not exists t_product('proNo' integer primary key autoincrement,'proName' text,'proPrice' integer)";
        
        // 2.执行,并判断建表是否成功
        BOOL result = [_db executeUpdate:sql];
        
        if (result) {
            NSLog(@"建表成功");
        } else {
            NSLog(@"建表失败");
        }
    };
}

#pragma mark - 1.create
+ (void)createModel:(STProductModel *)model{
    
    NSString *sql = [NSString stringWithFormat:@"insert into t_product (proName,proPrice) values ('%@',%d)",model.proName,model.proPrice];
    
    BOOL result = [_db executeUpdate:sql];
    
    if (result) {
        NSLog(@"插入成功");
    } else {
        NSLog(@"插入失败");
    }
}

#pragma mark - 2.delete
+ (void)deleteModel:(int)proNo{
    
    NSString *sql = [NSString stringWithFormat:@"delete from t_product where proNo = %d",proNo];
    
   BOOL result = [_db executeUpdate:sql];
    
    if (result) {
        NSLog(@"删除成功");
    } else {
        NSLog(@"删除失败");
    }
    
}

#pragma mark - 3.update
+ (void)updateModel:(STProductModel *)model withProNo:(int)proNo{
    
    NSString *sql = [NSString stringWithFormat:@"update t_product set proName = '%@',proPrice = %d where proNo = %d",model.proName,model.proPrice,proNo];
    
    BOOL result = [_db executeUpdate:sql];
    
    if (result) {
        NSLog(@"更新成功");
    } else {
        NSLog(@"更新失败");
    }
}

#pragma mark - 4.retrieve -模糊搜索
+ (NSArray<STProductModel *> *)retrieveAllProductWithKeyword:(NSString *)keyword{
    
    NSString *sql = [NSString stringWithFormat:@"select * from t_product where proName like '%%%@%%'",keyword];
    
    FMResultSet *set = [_db executeQuery:sql];
    
    NSMutableArray *array = [NSMutableArray array];
    
    // 取数据 -> 一行一行取
    while ([set next]) {
        
        // 取该行数据
        int proNo = [set intForColumnIndex:0];
        
        NSString *proName = [set stringForColumn:@"proName"];
        
        int proPrice = [set intForColumnIndex:2];
        
        STProductModel *model = [STProductModel new];
        
        model.proNo = proNo;
        model.proName = proName;
        model.proPrice = proPrice;
        // 添加到数组
        [array addObject:model];
    }
    
    return array.copy;
}

#pragma mark - 5.retrieve -> 查询全部
+ (void)retrieveAllProduct{
    
    NSString *sql = [NSString stringWithFormat:@"select * from t_product"];
    
    FMResultSet *set = [_db executeQuery:sql];
    
    // 取数据 -> 一行一行取
    while ([set next]) {
        
        // 取该行数据
        int proNo = [set intForColumnIndex:0];
        
        NSString *proName = [set stringForColumn:@"proName"];
        
        int proPrice = [set intForColumnIndex:2];
        
        // 打印查询信息
        NSLog(@"%d,%@,%d",proNo,proName,proPrice);
    }
}


@end
