//
//  NSDictionary+Safe.m
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSDictionary+Safe.h"

@implementation NSDictionary (Safe)
- (id)ll_safeObjectForKey:(NSString *)key
{
    if (key == nil || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    id object = [self objectForKey:key];
    if (object == nil || object == [NSNull null]) {
        return @"";
    }
    return object;
}

- (void)ll_safeSetValue:(id)object forKey:(id)key
{
    if ([key isKindOfClass:[NSNull class]]) {
        return;
    }
    if ([object isKindOfClass:[NSNull class]]) {
        [self setValue:@"" forKey:key];
    } else {
        [self setValue:object forKey:key];
    }
}

- (id)ll_objectForKeyCustom:(id)aKey
{
    id object = nil;

    // 检查是否字典对象
    if (![self isKindOfClass:[NSDictionary class]]) {
        return object;
    }

    // 保证key必须为字符串
    if (aKey && [aKey isKindOfClass:[NSString class]]) {
        object = [self ll_objectForKeyCustom:aKey];
    }

    return object;
}

- (id)ll_safeKeyForValue:(id)value
{
    for (id key in self.allKeys) {
        if ([value isEqual:[self objectForKey:key]]) {
            return key;
        }
    }
    return nil;
}
@end
