//
//  UIButton+Category.h
//  ll_iOS_Scaffold
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ButtonActionCallBack)(UIButton * _Nonnull button);

@interface UIButton (Category)

/// 使用block方式添加按钮回调（可以设置点击方式）
/// @param action 回调
/// @param controlEvents 点击方式
- (void)addCallBackAction:(ButtonActionCallBack _Nullable )action
         forControlEvents:(UIControlEvents)controlEvents;

/// 使用block方式添加按钮回调
/// @param action 回调
- (void)addCallBackAction:(ButtonActionCallBack _Nullable )action;


/// 设置按钮的帧动画
/// @param source 图片数组
- (void)ll_gifImageWithSource:(NSArray<UIImage *> *_Nonnull)source;

/**
 设置背景色

 @param color 颜色
 @param state state
 */
- (void)ll_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;

@end
