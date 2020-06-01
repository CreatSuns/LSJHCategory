//
//  NSMutableDictionary+Safe.h
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (Safe)
- (void)ll_safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)ll_safeObjectForKey:(id<NSCopying>)aKey;
@end
