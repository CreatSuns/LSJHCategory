//
//  NSObject+LLFloatBall.m
//  AFNetworking
//
//  Created by 李俊恒 on 2019/2/28.
//

#import "NSObject+LLFloatBall.h"

@implementation NSObject (LLFloatBall)
- (UIViewController *)ll_floatBallCurrentViewController
{
    UIViewController * vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    while (1) {
        if ([vc isKindOfClass:[UITabBarController class]]) {
            vc = ((UITabBarController *)vc).selectedViewController;
        }
        if ([vc isKindOfClass:[UINavigationController class]]) {
            vc = ((UINavigationController *)vc).visibleViewController;
        }
        if (vc.presentedViewController) {
            vc = vc.presentedViewController;
        } else {
            break;
        }
    }
    return vc;
}

- (UITabBarController *)ll_floatBallCurrentTabBarController
{
    return [self ll_floatBallCurrentViewController].tabBarController;
}

- (UINavigationController *)ll_floatBallCurrentNavigationController
{
    return [self ll_floatBallCurrentViewController].navigationController;
}
@end
