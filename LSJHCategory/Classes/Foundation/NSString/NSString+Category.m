//
//  NSString+Category.m
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Category)

+ (NSString *)ll_stringChineseFormat:(double)value
{
    if (value / 100000000 >= 1) {
        return [NSString stringWithFormat:@"%.0f亿", value / 100000000];
    } else if (value / 10000 >= 1 && value / 100000000 < 1) {
        return [NSString stringWithFormat:@"%.0f万", value / 10000];
    } else {
        return [NSString stringWithFormat:@"%.0f", value];
    }
}

+ (NSString *)ll_countNumAndChangeformat:(NSString *)num
{
    NSNumberFormatter * moneyFormatter = [[NSNumberFormatter alloc] init];
    moneyFormatter.positiveFormat      = @"###,###";
    //如要增加小数点请自行修改为@"###,###,##"
    return [moneyFormatter stringFromNumber:[num ll_toNumber]];
}

- (CGFloat)ll_heightWithFontSize:(CGFloat)fontSize width:(CGFloat)width
{
    return [UILabel ll_getHeightByWidth:width title:self font:[UIFont systemFontOfSize:fontSize]];
}

- (CGFloat)ll_widthWithFontSize:(CGFloat)fontSize height:(CGFloat)maxHeight
{
    return [UILabel ll_getWidthWithTitle:self font:FONT(fontSize)];
}

- (NSNumber *)ll_toNumber
{
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * number = [formatter numberFromString:self];
    return number;
}

@end

@implementation NSString (Html)
- (NSString *)ll_stringByStrippingHTML
{
    return [self stringByReplacingOccurrencesOfString:@"<[^>]+>"
                                           withString:@""
                                              options:NSRegularExpressionSearch
                                                range:NSMakeRange(0, self.length)];
}

- (NSString *)ll_stringByRemovingScriptsAndStrippingHTML
{
    NSMutableString * mString = [self mutableCopy];
    NSError * error;
    NSRegularExpression * regex =
    [NSRegularExpression regularExpressionWithPattern:@"<script[^>]*>[\\w\\W]*</script>"
                                              options:NSRegularExpressionCaseInsensitive
                                                error:&error];
    NSArray * matches = [regex matchesInString:mString
                                       options:NSMatchingReportProgress
                                         range:NSMakeRange(0, [mString length])];
    for (NSTextCheckingResult * match in [matches reverseObjectEnumerator]) {
        [mString replaceCharactersInRange:match.range withString:@""];
    }
    return [mString ll_stringByStrippingHTML];
}
@end
