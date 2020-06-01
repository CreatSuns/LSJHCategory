//
//  UIlabel+Property.h
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Property)
/// 设置标题
@property (nonatomic, copy) UILabel * (^setupText)(NSString * text);
/// 设置标题颜色
@property (nonatomic, copy) UILabel * (^setupTextColor)(UIColor * color);
/// 设置标题大小
@property (nonatomic, copy) UILabel * (^setupSystemFontSize)(CGFloat fontSize);
/// 设置文本对齐方式
@property (nonatomic, copy) UILabel * (^setupAlignment)(NSTextAlignment alignment);
/// 设置行数
@property (nonatomic, copy) UILabel * (^setupNumberOfLines)(NSInteger lines);
/// 设置行间距
@property (nonatomic, copy) UILabel * (^setupLineSpace)(CGFloat space);
/// 设置用户交互性
@property (nonatomic, copy) UILabel * (^setupUserInteractionEnabled)(BOOL enable);
/// 设置文本纵向对齐方式
@property (nonatomic, copy) UILabel * (^setupBaselineAdjustment)(UIBaselineAdjustment alignment);
@end

NS_ASSUME_NONNULL_END
