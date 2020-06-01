//
//  NSMutableString+Safe.h
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableString (Safe)
- (void)ll_safeInsertString:(NSString *)aString atIndex:(NSUInteger)loc;

- (void)ll_safeAppendString:(NSString *)aString;

- (void)ll_safeSetString:(NSString *)aString;

- (NSUInteger)ll_safeReplaceOccurrencesOfString:(NSString *)target
                                      withString:(NSString *)replacement
                                         options:(NSStringCompareOptions)options
                                           range:(NSRange)searchRange;
@end
