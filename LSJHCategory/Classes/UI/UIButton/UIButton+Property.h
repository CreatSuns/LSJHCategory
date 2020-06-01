//
//  UIButton+Property.h
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Property)
/// 设置标题
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupTitle)(NSString * _Nullable text);
/// 设置按钮文字大小
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupSystemFontSize)(CGFloat fontSize);
/// 设置文字颜色
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupTextColor)(UIColor * _Nullable color, UIControlState state);
/// 设置背景颜色
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupBackgroundColor)(UIColor * _Nullable color);
/// 设置图片
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupImage)(NSString * _Nullable imageName, UIControlState state);
/// 设置背景图片
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupBackgroundImage)(UIImage * _Nullable image, UIControlState state);
/// 设置是否被选中
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupSelected)(BOOL selected);
/// 设置水平方向对齐方式
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupHorizontalAlignment)(UIControlContentHorizontalAlignment alignment);
/// 设置垂直方向对齐方式
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupVerticalAlignment)(UIControlContentVerticalAlignment alignment);
/// 设置文字边距
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupTitleEdgeInsets)(UIEdgeInsets edge);
/// 设置图片边距
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupImageEdgeInsets)(UIEdgeInsets edge);
/// 设置富文本
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupAttributedTitle)(NSAttributedString * _Nullable title);
/// 设置是否关闭用户交互
@property (nonatomic, copy) UIButton * _Nonnull (^_Nullable setupUserInteractionEnabled)(BOOL enable);
@end

NS_ASSUME_NONNULL_END
