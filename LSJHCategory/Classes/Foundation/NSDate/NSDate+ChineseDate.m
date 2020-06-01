//
//  NSDate+ChineseDate.m
//
//  Created by 李世航 on 2019/8/5.
//

#import "NSDate+ChineseDate.h"

@implementation NSDate (ChineseDate)

+ (NSUInteger)ll_chineseYearWithDate:(NSDate *)date
{
    return [date ll_chineseYear];
}

+ (NSUInteger)ll_chineseMouthWithDate:(NSDate *)date
{
    return [date ll_chineseMouth];
}

+ (NSUInteger)ll_chineseDayWithDate:(NSDate *)date
{
    return [date ll_chineseDay];
}

- (NSUInteger)ll_chineseYear
{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [calendar component:NSCalendarUnitYear fromDate:self];
}

- (NSUInteger)ll_chineseMouth
{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [calendar component:NSCalendarUnitMonth fromDate:self];
}

- (NSUInteger)ll_chineseDay
{
    NSCalendar * calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierChinese];
    return [calendar component:NSCalendarUnitDay fromDate:self];
}

- (NSString *)ll_chineseDayString
{
    NSArray * array = @[
        @"初一",
        @"初二",
        @"初三",
        @"初四",
        @"初五",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
        @"",
    ];
    return @"";
}

@end
