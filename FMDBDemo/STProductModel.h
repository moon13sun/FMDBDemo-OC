//
//  STProductModel.h
//  FMDBDemo
//
//  Created by leergou on 16/7/2.
//  Copyright © 2016年 WhiteHouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface STProductModel : NSObject

/**
 *  proNo
 */
@property (nonatomic,assign) int proNo;

/**
 *  proName
 */
@property (nonatomic,copy) NSString *proName;

/**
 *  proPrice
 */
@property (nonatomic,assign) int proPrice;


@end
