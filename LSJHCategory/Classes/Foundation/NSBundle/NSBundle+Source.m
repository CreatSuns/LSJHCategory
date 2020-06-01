//
//  NSBundle+Source.m
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import "NSBundle+Source.h"

@implementation NSBundle (Source)
- (NSBundle *)ll_sourceBundleWithName:(NSString *)bundleName className:(NSString *)className{
    NSString * bundleNameCopy = [NSString stringWithFormat:@"/%@.bundle", bundleName];
    NSString * bundlePath = [[NSBundle bundleForClass:NSClassFromString(className)]
                             .resourcePath stringByAppendingPathComponent:bundleNameCopy];
    return [NSBundle bundleWithPath:bundlePath];
}

@end
