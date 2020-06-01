//
//  UIButton+Property.m
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import "UIButton+Property.h"

@implementation UIButton (Property)
- (UIButton * (^)(UIColor *, UIControlState))setupTextColor
{
    return ^UIButton *(UIColor * color, UIControlState state)
    {
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton * (^)(CGFloat))setupSystemFontSize
{
    return ^UIButton *(CGFloat fontSize)
    {
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        return self;
    };
}

- (UIButton * (^)(NSString *))setupTitle
{
    return ^UIButton *(NSString * text)
    {
        [self setTitle:text forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(UIColor *))setupBackgroundColor
{
    return ^UIButton *(UIColor * color)
    {
        self.backgroundColor = color;
        return self;
    };
}

- (UIButton * (^)(NSString *, UIControlState))setupImage
{
    return ^UIButton *(NSString * imageName, UIControlState state)
    {
        NSAssert(imageName.length != 0, @"imageName is nil");

        UIImage * image = [UIImage imageNamed:imageName];
        if (image) [self setImage:image forState:state];

        return self;
    };
}

- (UIButton * (^)(UIImage *, UIControlState))setupBackgroundImage
{
    return ^UIButton *(UIImage * image, UIControlState state)
    {
        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (UIButton * (^)(BOOL))setupSelected
{
    return ^UIButton *(BOOL selected)
    {
        self.selected = selected;
        return self;
    };
}

- (UIButton * (^)(UIControlContentHorizontalAlignment))setupHorizontalAlignment
{
    return ^UIButton *(UIControlContentHorizontalAlignment alignment)
    {
        [self setContentHorizontalAlignment:alignment];
        return self;
    };
}

- (UIButton * (^)(UIControlContentVerticalAlignment))setupVerticalAlignment
{
    return ^UIButton *(UIControlContentVerticalAlignment alignment)
    {
        [self setContentVerticalAlignment:alignment];
        return self;
    };
}

- (UIButton * (^)(UIEdgeInsets))setupTitleEdgeInsets
{
    return ^UIButton *(UIEdgeInsets edge)
    {
        [self setTitleEdgeInsets:edge];
        return self;
    };
}

- (UIButton * (^)(UIEdgeInsets))setupImageEdgeInsets
{
    return ^UIButton *(UIEdgeInsets edge)
    {
        [self setImageEdgeInsets:edge];
        return self;
    };
}

- (UIButton * (^)(NSAttributedString *))setupAttributedTitle
{
    return ^UIButton *(NSAttributedString * attributedTitle)
    {
        [self setAttributedTitle:attributedTitle forState:UIControlStateNormal];
        return self;
    };
}

- (UIButton * (^)(BOOL))setupUserInteractionEnabled
{
    return ^UIButton *(BOOL enable)
    {
        self.userInteractionEnabled = enable;
        return self;
    };
}
@end
