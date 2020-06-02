//
//  UIMenuItem+Category.h
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIMenuItem (Category)
- (instancetype)initWithTitle:(NSString *)title actionBlock:(void (^)(id sender))block;
@end
