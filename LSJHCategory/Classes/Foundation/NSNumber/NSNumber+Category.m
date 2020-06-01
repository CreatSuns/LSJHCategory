//
//  NSNumber+Category.m
//
//  Created by 李俊恒 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSNumber+Category.h"
#import "NSArray+Safe.h"

@implementation NSNumber (Category)

- (NSString *)ll_romanNumeral
{
    NSInteger n = [self integerValue];

    NSArray * numerals = [NSArray arrayWithObjects:@"M", @"CM", @"D", @"CD", @"C", @"XC", @"L",
                                                   @"XL", @"X", @"IX", @"V", @"IV", @"I", nil];

    NSUInteger valueCount = 13;
    NSUInteger values[]   = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};

    NSMutableString * numeralString = [NSMutableString string];

    for (NSUInteger i = 0; i < valueCount; i++) {
        while (n >= values[i]) {
            n -= values[i];
            [numeralString appendString:[numerals ll_safeObjectAtIndex:i]];
        }
    }
    return numeralString;
}

#pragma mark - round, ceil, floor
- (NSNumber *)ll_doRoundWithDigit:(NSUInteger)digit
{
    NSNumber * result             = nil;
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber *)ll_doCeilWithDigit:(NSUInteger)digit
{
    NSNumber * result             = nil;
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber *)ll_doFloorWithDigit:(NSUInteger)digit
{
    NSNumber * result             = nil;
    NSNumberFormatter * formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundFloor];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter stringFromNumber:self] doubleValue]];
    return result;
}

@end
