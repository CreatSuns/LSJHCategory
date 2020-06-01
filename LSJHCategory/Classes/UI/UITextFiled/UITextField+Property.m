//
//  UITextField+Property.m
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import "UITextField+Property.h"

@implementation UITextField (Property)
- (UITextField * _Nonnull (^)(NSString * _Nonnull))setupText

{
    return ^UITextField *(NSString * text)
    {
        self.text = text;
        return self;
    };
}

- (UITextField * (^)(UIColor *))setupTextColor
{
    return ^UITextField *(UIColor * textColor)
    {
        self.textColor = textColor;
        return self;
    };
}

- (UITextField * (^)(CGFloat))setupSystemFontSize
{
    return ^UITextField *(CGFloat fontSize)
    {
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UITextField * (^)(NSTextAlignment))setupTextAlignment
{
    return ^UITextField *(NSTextAlignment alignment)
    {
        self.textAlignment = alignment;
        return self;
    };
}

- (UITextField * (^)(NSString *))setupPlaceholder
{
    return ^UITextField *(NSString * text)
    {
        self.placeholder = text;
        return self;
    };
}

- (UITextField * (^)(UIKeyboardType))setupKeyBoardType
{
    return ^UITextField *(UIKeyboardType type)
    {
        self.keyboardType = type;
        return self;
    };
}

- (UITextField * (^)(UITextBorderStyle))setupBorderStyle
{
    return ^UITextField *(UITextBorderStyle style)
    {
        self.borderStyle = style;
        return self;
    };
}

- (UITextField * (^)(BOOL))setupSecureTextEntry
{
    return ^UITextField *(BOOL isSecure)
    {
        self.secureTextEntry = isSecure;
        return self;
    };
}

- (UITextField * (^)(BOOL))setupClearsOnBeginEditing
{
    return ^UITextField *(BOOL clear)
    {
        self.clearsOnBeginEditing = clear;
        return self;
    };
}

- (UITextField * (^)(id))setupDelegate
{
    return ^UITextField *(id obj)
    {
        self.delegate = obj;
        return self;
    };
}

- (UITextField * (^)(UITextFieldViewMode))setupClearButtonMode
{
    return ^UITextField *(UITextFieldViewMode mode)
    {
        self.clearButtonMode = mode;
        return self;
    };
}

- (UITextField * (^)(UIView *))setupLeftView
{
    return ^UITextField *(UIView * view)
    {
        self.leftView = view;
        return self;
    };
}

- (UITextField * (^)(UITextFieldViewMode))setupLeftViewMode
{
    return ^UITextField *(UITextFieldViewMode mode)
    {
        self.leftViewMode = mode;
        return self;
    };
}

- (UITextField * (^)(UIView *))setupRightView
{
    return ^UITextField *(UIView * view)
    {
        self.rightView = view;
        return self;
    };
}

- (UITextField * (^)(UITextFieldViewMode))setupRightViewMode
{
    return ^UITextField *(UITextFieldViewMode mode)
    {
        self.rightViewMode = mode;
        return self;
    };
}
@end
