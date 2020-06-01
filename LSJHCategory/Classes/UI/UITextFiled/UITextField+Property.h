//
//  UITextField+Property.h
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Property)
/// 设置文本
@property (nonatomic, copy) UITextField * (^setupText)(NSString * text);
/// 设置文本颜色
@property (nonatomic, copy) UITextField * (^setupTextColor)(UIColor * textColor);
/// 设置文本字体大小
@property (nonatomic, copy) UITextField * (^setupSystemFontSize)(CGFloat fontSize);
/// 设置文本对齐方式
@property (nonatomic, copy) UITextField * (^setupTextAlignment)(NSTextAlignment alignment);
/// 设置占位文字
@property (nonatomic, copy) UITextField * (^setupPlaceholder)(NSString * text);
/// 设置键盘类型
@property (nonatomic, copy) UITextField * (^setupKeyBoardType)(UIKeyboardType type);
/// 设置边框类型
@property (nonatomic, copy) UITextField * (^setupBorderStyle)(UITextBorderStyle style);
/// 设置是否加密输入
@property (nonatomic, copy) UITextField * (^setupSecureTextEntry)(BOOL isSecure);
/// 设置是否在输入时显示删除按钮
@property (nonatomic, copy) UITextField * (^setupClearsOnBeginEditing)(BOOL clear);
/// 设置代理
@property (nonatomic, copy) UITextField * (^setupDelegate)(id obj);
/// 设置清除按钮模式
@property (nonatomic, copy) UITextField * (^setupClearButtonMode)(UITextFieldViewMode mode);
/// 设置左侧视图
@property (nonatomic, copy) UITextField * (^setupLeftView)(UIView * view);
/// 设置左侧视图显示模式
@property (nonatomic, copy) UITextField * (^setupLeftViewMode)(UITextFieldViewMode mode);
/// 设置右侧视图
@property (nonatomic, copy) UITextField * (^setupRightView)(UIView * view);
/// 设置右侧视图显示模式
@property (nonatomic, copy) UITextField * (^setupRightViewMode)(UITextFieldViewMode mode);
@end

NS_ASSUME_NONNULL_END
