//
//  STProductTools.h
//  FMDBDemo
//
//  Created by leergou on 16/7/2.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STProductModel.h"

// 工具的作用是 对model 进行 CRUD 操作

@interface STProductTools : NSObject

/**
 *  增加模型接口
 */
+ (void)createModel:(STProductModel *)model;

/**
*  删除模型接口
*/
+ (void)deleteModel:(int)proNO;

/**
*  更新模型接口
*/
+ (void)updateModel:(STProductModel *)model withProNo:(int)proNo;

/**
*  查询所有数据
*/
+ (NSArray <STProductModel *> *)retrieveAllProductWithKeyword:(NSString *)keyword;

/**
 *  查询全部
 */
+ (void)retrieveAllProduct;

@end
