//
//  NSDictionary+Safe.h
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Safe)

/**
 通过key获取Value值

 @param key key
 @return value
 */
- (id)ll_safeObjectForKey:(NSString *)key;

/**
 key-value方式设置dict

 @param object value
 @param key key
 */
- (void)ll_safeSetValue:(id)object forKey:(id)key;

- (id)ll_objectForKeyCustom:(id)aKey;

/**
 value获取key

 @param value value
 @return key
 */
- (id)ll_safeKeyForValue:(id)value;
@end
