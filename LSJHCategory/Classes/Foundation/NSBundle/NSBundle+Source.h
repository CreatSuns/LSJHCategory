//
//  NSBundle+Source.h
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Source)

/// 获取开发包资源
/// @param bundleName 开发包名称
/// @param className 类名
- (NSBundle *)ll_sourceBundleWithName:(NSString *)bundleName
                            className:(NSString *)className;

@end

NS_ASSUME_NONNULL_END
