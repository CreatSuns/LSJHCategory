//
//  UIColor+Category.m
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIColor+Category.h"

@implementation UIColor (Category)
+ (UIColor *)ll_hex:(NSString *)hexString
{
    NSString * cString = [[hexString
    stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
    uppercaseString];

    if ([cString length] < 6) return [UIColor blackColor];
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    if ([cString length] != 6) return [UIColor blackColor];

    NSRange range;
    range.location     = 0;
    range.length       = 2;
    NSString * rString = [cString substringWithRange:range];

    range.location     = 2;
    NSString * gString = [cString substringWithRange:range];

    range.location     = 4;
    NSString * bString = [cString substringWithRange:range];

    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return [UIColor colorWithRed:((float)r / 255.0f)
                           green:((float)g / 255.0f)
                            blue:((float)b / 255.0f)
                           alpha:1.0f];
}

+ (UIColor *)ll_colorWithRGB:(NSUInteger)aRGB
{
    return [UIColor colorWithRed:((float)((aRGB & 0xFF0000) >> 16)) / 255.0
                           green:((float)((aRGB & 0xFF00) >> 8)) / 255.0
                            blue:((float)(aRGB & 0xFF)) / 255.0
                           alpha:1.0];
}

+ (UIColor *)ll_colorRGBonvertToHSB:(UIColor *)color withBrighnessDelta:(CGFloat)delta
{
    CGFloat hue        = 0.0f;
    CGFloat saturation = 0.0f;
    CGFloat brightness = 0.0f;
    CGFloat alpha      = 0.0f;

    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

    brightness += delta;

    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (UIColor *)ll_colorRGBonvertToHSB:(UIColor *)color withAlphaDelta:(CGFloat)delta
{
    CGFloat hue        = 0.0f;
    CGFloat saturation = 0.0f;
    CGFloat brightness = 0.0f;
    CGFloat alpha      = 0.0f;

    [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];

    alpha += delta;

    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:alpha];
}

+ (NSString *)ll_toStrByUIColor:(UIColor *)color
{
    CGFloat r, g, b, a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    int rgb = (int)(r * 255.0f) << 16 | (int)(g * 255.0f) << 8 | (int)(b * 255.0f) << 0;
    return [NSString stringWithFormat:@"#%06x", rgb];
}

@end
UIColor * ll_rgb(CGFloat red, CGFloat green, CGFloat blue)
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
}

UIColor * ll_rgbA(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}
