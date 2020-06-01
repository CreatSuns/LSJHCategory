//
//  UIlabel+Property.m
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import "UILabel+Property.h"

@implementation UILabel (Property)
- (UILabel * (^)(CGFloat))setupSystemFontSize
{
    return ^UILabel *(CGFloat fontSize)
    {
        self.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UILabel * (^)(UIColor *))setupTextColor
{
    return ^UILabel *(UIColor * color)
    {
        self.textColor = color;
        return self;
    };
}

- (UILabel * (^)(NSTextAlignment))setupAlignment
{
    return ^UILabel *(NSTextAlignment alignment)
    {
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel * (^)(CGFloat))setupLineSpace
{
    return ^UILabel *(CGFloat space)
    {
        NSAssert(self.text.length != 0, @"文本无内容");
        NSMutableAttributedString * attributedString =
        [[NSMutableAttributedString alloc] initWithString:self.text];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:space];
        [attributedString addAttribute:NSParagraphStyleAttributeName
                                 value:paragraphStyle
                                 range:NSMakeRange(0, [self.text length])];
        self.attributedText = attributedString;
        return self;
    };
}

- (UILabel * (^)(NSInteger))setupNumberOfLines
{
    return ^UILabel *(NSInteger lines)
    {
        self.numberOfLines = lines;
        return self;
    };
}

- (UILabel * (^)(NSString *))setupText
{
    return ^UILabel *(NSString * text)
    {
        self.text = text;
        return self;
    };
}

- (UILabel * (^)(BOOL))setupUserInteractionEnabled
{
    return ^UILabel *(BOOL enable)
    {
        self.userInteractionEnabled = enable;
        return self;
    };
}

- (UILabel * (^)(UIBaselineAdjustment))setupBaselineAdjustment
{
    return ^UILabel *(UIBaselineAdjustment alignment)
    {
        self.baselineAdjustment = alignment;
        return self;
    };
}
@end
