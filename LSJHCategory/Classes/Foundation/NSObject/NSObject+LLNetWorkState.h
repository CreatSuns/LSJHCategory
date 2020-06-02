//
//  NSObject+LLNetWorkState.h
//
//  Created by 李世航 on 2018/12/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LLNetWorkStatus) {
    LLNetWorkStatusNoReach,
    LLNetWorkStatusWWAN,
    LLNetWorkStatusWIFI,
};

@interface NSObject (LLNetWorkState)

- (void)ll_getNetWorkStatus:(void (^)(LLNetWorkStatus status))handle;

@end

NS_ASSUME_NONNULL_END
