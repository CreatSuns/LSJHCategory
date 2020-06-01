//
//  UITextField+Category.m
//
//  Created by 李俊恒 on 2018/7/20.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UITextField+Category.h"
#import <objc/runtime.h>

@implementation UITextField (Category)
- (void)ll_setPlaceholedr:(NSString *)placeholedr color:(UIColor *)color font:(CGFloat)font
{
    if (!self.attributedPlaceholder) {
        NSMutableAttributedString * placeholderString = [[NSMutableAttributedString alloc] initWithString:placeholedr attributes:@{NSForegroundColorAttributeName : color}];
        [placeholderString addAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:font] } range:NSMakeRange(0, placeholedr.length)];
        self.attributedPlaceholder = placeholderString;
    }
}
- (void)ll_setLeftViewWithText:(NSString *)text textColor:(UIColor *)color font:(CGFloat)font
{
    CGFloat width       = [UILabel ll_getWidthWithTitle:text font:FONT(font)];
    UILabel * leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, self.cmam_height)];
    leftLabel.text      = text;
    leftLabel.textColor = color;
    leftLabel.font      = FONT(font);
    self.leftView       = leftLabel;
    self.leftViewMode   = UITextFieldViewModeAlways;
}

- (void)ll_setRightButtonWithView:(UIButton *)button
{
    self.rightView     = button;
    self.rightViewMode = UITextFieldViewModeAlways;
}
- (void)ll_setLeftViewWithView:(UIView *)view
{
    self.leftView     = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)ll_setLeftViewImageWithImageNamed:(NSString *)imageNamed
{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    self.leftView           = imageView;
    self.leftViewMode       = UITextFieldViewModeAlways;
}
- (void)ll_setRightViewImageWithImageNamed:(NSString *)imageNamed
{
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageNamed]];
    self.rightView          = imageView;
    self.rightViewMode      = UITextFieldViewModeWhileEditing;
}
- (void)ll_setTextFiledTypeStyleLineWithColor:(UIColor *)color
{
    UIView * lineView        = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor ll_hex:@"#e8e8e8"];
    [self addSubview:lineView];
    lineView.cmam_left   = 0;
    lineView.cmam_width  = self.cmam_width;
    lineView.cmam_height = 1;
    lineView.cmam_bottom = self.cmam_height + 10 * SizeAdapter;
}
- (void)ll_setUserNameTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor
{
    self.borderStyle     = UITextBorderStyleNone;
    self.backgroundColor = backGroundColor;
    self.textColor       = color;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.keyboardType    = UIKeyboardTypeDefault;
    self.returnKeyType   = UIReturnKeyNext;
    self.font            = FONT(font);
}
- (void)ll_setPasswordTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor
{
    self.font            = FONT(font);
    self.borderStyle     = UITextBorderStyleNone;
    self.backgroundColor = backGroundColor;
    self.textColor       = color;
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.keyboardType    = UIKeyboardTypeDefault;
    self.returnKeyType   = UIReturnKeyGo;
    self.secureTextEntry = YES;
}
@end

@implementation UITextField (Action)

- (void)ll_addTextChangeWithEvent:(UIControlEvents)event
                        textHandle:(void (^)(UITextField * text))textHandle
{
    objc_setAssociatedObject(self, @"llTextFieldBlock", textHandle,
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(textChange:) forControlEvents:event];
}

- (void)textChange:(UITextField *)textField
{
    void (^textH)(UITextField * textField) = objc_getAssociatedObject(self, @"llTextFieldBlock");
    if (textH) {
        textH(textField);
    }
}

@end
