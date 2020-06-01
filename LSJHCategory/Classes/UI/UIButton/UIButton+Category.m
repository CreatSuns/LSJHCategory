//
//  UIButton+Category.m
//  ll_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIButton+Category.h"
#import "UIImage+Catagory.h"
#import <objc/runtime.h>

@implementation UIButton (Category)

- (void)addCallBackAction:(ButtonActionCallBack)action
         forControlEvents:(UIControlEvents)controlEvents
{
    objc_setAssociatedObject(self, @selector(addCallBackAction:forControlEvents:), action,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(blockActionTouched:) forControlEvents:controlEvents];
}

- (void)addCallBackAction:(ButtonActionCallBack)action
{
    [self addCallBackAction:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)blockActionTouched:(UIButton *)btn
{
    ButtonActionCallBack block =
    objc_getAssociatedObject(self, @selector(addCallBackAction:forControlEvents:));
    if (block) {
        block(btn);
    }
}

- (void)ll_setBackgroundColor:(UIColor *)color forState:(UIControlState)state
{
    [self setBackgroundImage:[UIImage ll_createImageWithColor:color] forState:state];
}

- (void)ll_gifImageWithSource:(NSArray<UIImage *> * _Nonnull)source
{
    self.imageView.animationImages      = source;
    self.imageView.animationRepeatCount = MAXFLOAT;
    self.imageView.animationDuration    = source.count / 60;
    [self.imageView startAnimating];
}

@end
