//
//  NSArray+Category.m
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSArray+Category.h"

@implementation NSArray (Category)
- (NSString *)ll_transToJSONString
{
    NSData * paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}

- (NSArray *)ll_reverseArray
{
    NSMutableArray * arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator * enumerator  = [self reverseObjectEnumerator];

    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }

    return arrayTemp;
}
@end
