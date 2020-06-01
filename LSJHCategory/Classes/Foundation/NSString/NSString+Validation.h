//
//  NSString+Safe.h
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Validation)
- (NSString *)ll_safeSubstringFromIndex:(NSUInteger)from;

- (NSString *)ll_safeSubstringToIndex:(NSUInteger)to;

- (NSString *)ll_safeSubstringWithRange:(NSRange)range;

- (NSRange)ll_safeRangeOfString:(NSString *)aString;

- (NSRange)ll_safeRangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;

- (NSString *)ll_safeStringByAppendingString:(NSString *)aString;
@end
