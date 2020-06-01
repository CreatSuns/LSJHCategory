//
//  NSDate+Category.m
//
//  Created by 李俊恒 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate (Category)

- (NSUInteger)ll_day
{
    return [NSDate ll_day:self];
}

- (NSUInteger)ll_month
{
    return [NSDate ll_month:self];
}

- (NSUInteger)ll_year
{
    return [NSDate ll_year:self];
}

- (NSUInteger)ll_hour
{
    return [NSDate ll_hour:self];
}

- (NSUInteger)ll_minute
{
    return [NSDate ll_minute:self];
}

- (NSUInteger)ll_second
{
    return [NSDate ll_second:self];
}

+ (NSUInteger)ll_day:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitDay) fromDate:date];

    return [dayComponents day];
}

+ (NSUInteger)ll_month:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitMonth) fromDate:date];

    return [dayComponents month];
}

+ (NSUInteger)ll_year:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitYear) fromDate:date];

    return [dayComponents year];
}

+ (NSUInteger)ll_hour:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitHour) fromDate:date];

    return [dayComponents hour];
}

+ (NSUInteger)ll_minute:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitMinute) fromDate:date];

    return [dayComponents minute];
}

+ (NSUInteger)ll_second:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * dayComponents = [calendar components:(NSCalendarUnitSecond) fromDate:date];

    return [dayComponents second];
}

- (NSUInteger)ll_daysInYear
{
    return [NSDate ll_daysInYear:self];
}

+ (NSUInteger)ll_daysInYear:(NSDate *)date
{
    return [self ll_isLeapYear:date] ? 366 : 365;
}

- (BOOL)ll_isLeapYear
{
    return [NSDate ll_isLeapYear:self];
}

+ (BOOL)ll_isLeapYear:(NSDate *)date
{
    NSUInteger year = [date ll_year];
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

- (NSString *)ll_formatYMD
{
    return [NSDate ll_formatYMD:self];
}

+ (NSString *)ll_formatYMD:(NSDate *)date
{
    return
    [NSString stringWithFormat:@"%lu-%02lu-%02lu", (unsigned long)[date ll_year],
                               (unsigned long)[date ll_month], (unsigned long)[date ll_day]];
}

- (NSUInteger)ll_weeksOfMonth
{
    return [NSDate ll_weeksOfMonth:self];
}

+ (NSUInteger)ll_weeksOfMonth:(NSDate *)date
{
    return [[date ll_lastdayOfMonth] ll_weekOfYear] -
           [[date ll_begindayOfMonth] ll_weekOfYear] + 1;
}

- (NSUInteger)ll_weekOfYear
{
    return [NSDate ll_weekOfYear:self];
}

+ (NSUInteger)ll_weekOfYear:(NSDate *)date
{
    NSUInteger i;
    NSUInteger year = [date ll_year];

    NSDate * lastdate = [date ll_lastdayOfMonth];

    for (i = 1;[[lastdate ll_dateAfterDay:-7 * i] ll_year] == year; i++) {
    }

    return i;
}

- (NSDate *)ll_dateAfterDay:(NSUInteger)day
{
    return [NSDate ll_dateAfterDate:self day:day];
}

+ (NSDate *)ll_dateAfterDate:(NSDate *)date day:(NSInteger)day
{
    NSCalendar * calendar              = [NSCalendar currentCalendar];
    NSDateComponents * componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setDay:day];

    NSDate * dateAfterDay = [calendar dateByAddingComponents:componentsToAdd toDate:date options:0];

    return dateAfterDay;
}

- (NSDate *)ll_dateAfterMonth:(NSUInteger)month
{
    return [NSDate ll_dateAfterDate:self month:month];
}

+ (NSDate *)ll_dateAfterDate:(NSDate *)date month:(NSInteger)month
{
    NSCalendar * calendar              = [NSCalendar currentCalendar];
    NSDateComponents * componentsToAdd = [[NSDateComponents alloc] init];
    [componentsToAdd setMonth:month];
    NSDate * dateAfterMonth =
    [calendar dateByAddingComponents:componentsToAdd
                              toDate:date
                             options:0];

    return dateAfterMonth;
}

- (NSDate *)ll_begindayOfMonth
{
    return [NSDate ll_begindayOfMonth:self];
}

+ (NSDate *)ll_begindayOfMonth:(NSDate *)date
{
    return [self ll_dateAfterDate:date day:-[date ll_day] + 1];
}

- (NSDate *)ll_lastdayOfMonth
{
    return [NSDate ll_lastdayOfMonth:self];
}

+ (NSDate *)ll_lastdayOfMonth:(NSDate *)date
{
    NSDate * lastDate = [self ll_begindayOfMonth:date];
    return [[lastDate ll_dateAfterMonth:1] ll_dateAfterDay:-1];
}

- (NSUInteger)ll_daysAgo
{
    return [NSDate ll_daysAgo:self];
}

+ (NSUInteger)ll_daysAgo:(NSDate *)date
{
    NSCalendar * calendar = [NSCalendar currentCalendar];

    NSDateComponents * components =
    [calendar components:(NSCalendarUnitDay)
                fromDate:date
                  toDate:[NSDate date]
                 options:0];

    return [components day];
}

- (NSInteger)ll_weekday
{
    return [NSDate ll_weekday:self];
}

+ (NSInteger)ll_weekday:(NSDate *)date
{
    NSCalendar * gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents * comps = [gregorian components:(NSCalendarUnitDay | NSCalendarUnitMonth |
                                                      NSCalendarUnitYear | NSCalendarUnitWeekday)
                                            fromDate:date];
    NSInteger weekday      = [comps weekday];
    weekday == 1 ? weekday = 7 : weekday--;
    return weekday;
}

- (NSString *)ll_dayFromWeekday
{
    return [NSDate ll_dayFromWeekday:self];
}

+ (NSString *)ll_dayFromWeekday:(NSDate *)date
{
    switch ([date ll_weekday]) {
        case 7:
            return @"星期天";
            break;
        case 1:
            return @"星期一";
            break;
        case 2:
            return @"星期二";
            break;
        case 3:
            return @"星期三";
            break;
        case 4:
            return @"星期四";
            break;
        case 5:
            return @"星期五";
            break;
        case 6:
            return @"星期六";
            break;
        default:
            break;
    }
    return @"";
}

- (BOOL)ll_isSameDay:(NSDate *)anotherDate
{
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDateComponents * components1 =
    [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                fromDate:self];
    NSDateComponents * components2 =
    [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                fromDate:anotherDate];
    return ([components1 year] == [components2 year] &&
            [components1 month] == [components2 month] && [components1 day] == [components2 day]);
}

- (BOOL)ll_isToday
{
    return [self ll_isSameDay:[NSDate date]];
}

- (NSDate *)ll_dateByAddingDays:(NSUInteger)days
{
    NSDateComponents * c = [[NSDateComponents alloc] init];
    c.day                = days;
    return [[NSCalendar currentCalendar] dateByAddingComponents:c toDate:self options:0];
}

+ (NSString *)ll_monthWithMonthNumber:(NSInteger)month
{
    switch (month) {
        case 1:
            return @"January";
            break;
        case 2:
            return @"February";
            break;
        case 3:
            return @"March";
            break;
        case 4:
            return @"April";
            break;
        case 5:
            return @"May";
            break;
        case 6:
            return @"June";
            break;
        case 7:
            return @"July";
            break;
        case 8:
            return @"August";
            break;
        case 9:
            return @"September";
            break;
        case 10:
            return @"October";
            break;
        case 11:
            return @"November";
            break;
        case 12:
            return @"December";
            break;
        default:
            break;
    }
    return @"";
}

+ (NSString *)ll_stringWithDate:(NSDate *)date format:(NSString *)format
{
    return [date ll_stringWithFormat:format];
}

- (NSString *)ll_stringWithFormat:(NSString *)format
{
    NSDateFormatter * outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:format];

    NSString * retStr = [outputFormatter stringFromDate:self];

    return retStr;
}

+ (NSDate *)ll_dateWithString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter * inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];

    NSDate * date = [inputFormatter dateFromString:string];

    return date;
}

- (NSUInteger)ll_daysInMonth:(NSUInteger)month
{
    return [NSDate ll_daysInMonth:self month:month];
}

+ (NSUInteger)ll_daysInMonth:(NSDate *)date month:(NSUInteger)month
{
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 2:
            return [date ll_isLeapYear] ? 29 : 28;
    }
    return 30;
}

- (NSUInteger)ll_daysInMonth
{
    return [NSDate ll_daysInMonth:self];
}

+ (NSUInteger)ll_daysInMonth:(NSDate *)date
{
    return [self ll_daysInMonth:date month:[date ll_month]];
}

- (NSString *)ll_timeInfo
{
    return [NSDate ll_timeInfoWithDate:self];
}

+ (NSString *)ll_timeInfoWithDate:(NSDate *)date
{
    return [self
    ll_timeInfoWithDateString:[self ll_stringWithDate:date format:[self ll_ymdHmsFormat]]];
}

+ (NSString *)ll_timeInfoWithDateString:(NSString *)dateString
{
    NSDate * date = [self ll_dateWithString:dateString format:[self ll_ymdHmsFormat]];

    NSDate * curDate    = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];

    int month = (int)([curDate ll_month] - [date ll_month]);
    int year  = (int)([curDate ll_year] - [date ll_year]);
    int day   = (int)([curDate ll_day] - [date ll_day]);

    NSTimeInterval retTime = 1.0;
    if (time < 3600) { // 小于一小时
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    } else if (time < 3600 * 24) { // 小于一天，也就是今天
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    } else if (time < 3600 * 24 * 2) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else if ((abs(year) == 0 && abs(month) <= 1) ||
             (abs(year) == 1 && [curDate ll_month] == 1 && [date ll_month] == 12)) {
        int retDay = 0;
        if (year == 0) {      // 同年
            if (month == 0) { // 同月
                retDay = day;
            }
        }

        if (retDay <= 0) {
            // 获取发布日期中，该月有多少天
            int totalDays = (int)[self ll_daysInMonth:date month:[date ll_month]];

            // 当前天数 + （发布日期月中的总天数-发布日期月中发布日，即等于距离今天的天数）
            retDay = (int)[curDate ll_day] + (totalDays - (int)[date ll_day]);
        }

        return [NSString stringWithFormat:@"%d天前", (abs)(retDay)];
    } else {
        if (abs(year) <= 1) {
            if (year == 0) { // 同年
                return [NSString stringWithFormat:@"%d个月前", abs(month)];
            }

            // 隔年
            int month    = (int)[curDate ll_month];
            int preMonth = (int)[date ll_month];
            if (month == 12 && preMonth == 12) { // 隔年，但同月，就作为满一年来计算
                return @"1年前";
            }
            return [NSString stringWithFormat:@"%d个月前", (abs)(12 - preMonth + month)];
        }

        return [NSString stringWithFormat:@"%d年前", abs(year)];
    }

    return @"1小时前";
}

- (NSString *)ll_ymdFormat
{
    return [NSDate ll_ymdFormat];
}

- (NSString *)ll_hmsFormat
{
    return [NSDate ll_hmsFormat];
}

- (NSString *)ll_ymdHmsFormat
{
    return [NSDate ll_ymdHmsFormat];
}

+ (NSString *)ll_ymdFormat
{
    return @"yyyy-MM-dd";
}

+ (NSString *)ll_hmsFormat
{
    return @"HH:mm:ss";
}

+ (NSString *)ll_ymdHmsFormat
{
    return [NSString stringWithFormat:@"%@ %@", [self ll_ymdFormat], [self ll_hmsFormat]];
}

- (NSDate *)ll_offsetYears:(int)numYears
{
    return [NSDate ll_offsetYears:numYears fromDate:self];
}

+ (NSDate *)ll_offsetYears:(int)numYears fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }
    NSCalendar * gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setYear:numYears];

    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
}

- (NSDate *)ll_offsetMonths:(int)numMonths
{
    return [NSDate ll_offsetMonths:numMonths fromDate:self];
}

+ (NSDate *)ll_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }

    NSCalendar * gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:numMonths];

    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
}

- (NSDate *)ll_offsetDays:(int)numDays
{
    return [NSDate ll_offsetDays:numDays fromDate:self];
}

+ (NSDate *)ll_offsetDays:(int)numDays fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }
    NSCalendar * gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:numDays];

    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
}

- (NSDate *)ll_offsetHours:(int)hours
{
    return [NSDate ll_offsetHours:hours fromDate:self];
}

+ (NSDate *)ll_offsetHours:(int)numHours fromDate:(NSDate *)fromDate
{
    if (fromDate == nil) {
        return nil;
    }

    NSCalendar * gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    NSDateComponents * offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:numHours];

    return [gregorian dateByAddingComponents:offsetComponents toDate:fromDate options:0];
}

+ (NSString *)ll_stringNowWithFullFormatter
{
    NSDate * now                = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * str = [formatter stringFromDate:now];
    return str;
}

+ (NSString *)ll_stringNowWithFormatter:(NSString *)format
{
    NSDate * now                = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString * str = [formatter stringFromDate:now];
    return str;
}

+ (NSString *)ll_stringWithTimeInterval:(NSUInteger)time Formatter:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [formatter setDateFormat:format];
//    NSTimeZone * localtimezone = [NSTimeZone systemTimeZone];
//    NSInteger offset           = [localtimezone secondsFromGMT];
    NSDate * date              = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSString * timeStr         = [formatter stringFromDate:date];
    return timeStr;
}

+ (NSDate *)ll_dateWithTimeInterval:(NSUInteger)time Formatter:(NSString *)format{
    NSDate * date              = [NSDate dateWithTimeIntervalSince1970:time/1000];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString * formatDateString = [formatter stringFromDate:date];
    NSDate * otherDate = [formatter dateFromString:formatDateString];
    return otherDate;
}

+ (NSTimeInterval)ll_now
{
    NSDate * now      = [NSDate date];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger offset  = [zone secondsFromGMT];
    return [now timeIntervalSince1970] + offset;
}

+ (NSTimeInterval)ll_timeIntervalFromString:(NSString *)timeStr Formatter:(NSString *)format
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate * date     = [formatter dateFromString:timeStr];
    NSTimeZone * zone = [NSTimeZone systemTimeZone];
    NSInteger offset  = [zone secondsFromGMT];
    return ([date timeIntervalSince1970] + offset);
}
+ (NSString *)ll_getNowTimeTimes
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];

    [formatter setDateStyle:NSDateFormatterMediumStyle];

    [formatter setTimeStyle:NSDateFormatterShortStyle];

    [formatter
    setDateFormat:
    @"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制

    //设置时区,这个对于时间的处理有时很重要

    NSTimeZone * timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];

    [formatter setTimeZone:timeZone];

    NSDate * datenow = [NSDate date]; //现在时间,你可以输出来看下是什么格式

    NSString * timeSp =
    [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970] * 1000];

    return timeSp;
}

+ (NSString *)getNowTimeTimesSeconds
{
    // 获取10位时间戳
    NSDate * dat = [NSDate dateWithTimeIntervalSinceNow:0];

    NSTimeInterval a = [dat timeIntervalSince1970];

    NSString * timeString = [NSString stringWithFormat:@"%0.f", a]; //转为字符型
    return timeString;
}

- (LLDateCompare)ll_dateCompareWithDate:(NSDate *)date
{
    NSComparisonResult result = [self compare:date];
    if (result == NSOrderedAscending) {
        return LLDateCompareLess;
    } else if (result == NSOrderedDescending) {
        return LLDateCompareGreater;
    } else {
        return LLDateCompareSame;
    }
}
@end
