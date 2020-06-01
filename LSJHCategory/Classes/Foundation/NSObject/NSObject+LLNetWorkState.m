//
//  NSObject+LLNetWorkState.m
//
//  Created by 李世航 on 2018/12/21.
//

#import "NSObject+LLNetWorkState.h"
#import "Reachability.h"

@implementation NSObject (LLNetWorkState)

- (void)ll_getNetWorkStatus:(void (^)(LLNetWorkStatus status))handle
{
    Reachability * reachability  = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NetworkStatus internetStatus = [reachability currentReachabilityStatus];

    switch (internetStatus) {
        case ReachableViaWiFi:
            handle(LLNetWorkStatusWIFI);
            break;

        case ReachableViaWWAN:
            handle(LLNetWorkStatusWWAN);
            break;

        case NotReachable:
            handle(LLNetWorkStatusNoReach);

        default:
            break;
    }
}

@end
