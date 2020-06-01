//
//  NSNumber+Category.h
//
//  Created by 李俊恒 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Category)

/** 返回自己对应的罗马数字 */
- (NSString *)ll_romanNumeral;

/**
 四舍五入

 @param digit 限制最大位数
 @return 结果
 */
- (NSNumber *)ll_doRoundWithDigit:(NSUInteger)digit;

/**
 取上整

 @param digit 限制最大位数
 @return 结果
 */
- (NSNumber *)ll_doCeilWithDigit:(NSUInteger)digit;

/**
 取下整

 @param digit 限制最大位数
 @return 结果
 */
- (NSNumber *)ll_doFloorWithDigit:(NSUInteger)digit;

@end
