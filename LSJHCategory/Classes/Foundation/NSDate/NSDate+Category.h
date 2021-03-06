//
//  NSDate+Category.h
//
//  Created by 李俊恒 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LLDateCompare) {
    LLDateCompareGreater,
    LLDateCompareSame,
    LLDateCompareLess,
};

@interface NSDate (Category)
/**
 * 根据日期返回字符串
 */
+ (NSString *)ll_stringWithDate:(NSDate *)date format:(NSString *)format;
- (NSString *)ll_stringWithFormat:(NSString *)format;
+ (NSDate *)ll_dateWithString:(NSString *)string format:(NSString *)format;

/**
 * 根据TimeInterval获取时间字符串(13位时间戳)
 */
+ (NSString *)ll_stringWithTimeInterval:(NSUInteger)time Formatter:(NSString *)format;

+ (NSDate *)ll_dateWithTimeInterval:(NSUInteger)time Formatter:(NSString *)format;
/**
 * 根据字符串和格式获取TimeInterval时间,带有时区偏移
 */
+ (NSTimeInterval)ll_timeIntervalFromString:(NSString *)timeStr Formatter:(NSString *)format;

/**
 * 当前TimeInterval时间,带有时区偏移
 */
+ (NSTimeInterval)ll_now;

/**
 * yyyy-MM-dd HH:mm:ss格式的当前时间
 */
+ (NSString *)ll_stringNowWithFullFormatter;

/**
 * 自定义格式的当前时间
 */
+ (NSString *)ll_stringNowWithFormatter:(NSString *)format;

/**
 * 获取日、月、年、小时、分钟、秒
 */
- (NSUInteger)ll_day;
- (NSUInteger)ll_month;
- (NSUInteger)ll_year;
- (NSUInteger)ll_hour;
- (NSUInteger)ll_minute;
- (NSUInteger)ll_second;
+ (NSUInteger)ll_day:(NSDate *)date;
+ (NSUInteger)ll_month:(NSDate *)date;
+ (NSUInteger)ll_year:(NSDate *)date;
+ (NSUInteger)ll_hour:(NSDate *)date;
+ (NSUInteger)ll_minute:(NSDate *)date;
+ (NSUInteger)ll_second:(NSDate *)date;

/**
 * 获取一年中的总天数
 */
- (NSUInteger)ll_daysInYear;
+ (NSUInteger)ll_daysInYear:(NSDate *)date;

/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)ll_isLeapYear;
+ (BOOL)ll_isLeapYear:(NSDate *)date;

/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)ll_weekOfYear;
+ (NSUInteger)ll_weekOfYear:(NSDate *)date;

/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)ll_formatYMD;
+ (NSString *)ll_formatYMD:(NSDate *)date;

/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)ll_weeksOfMonth;
+ (NSUInteger)ll_weeksOfMonth:(NSDate *)date;

/**
 * 获取该月的第一天的日期
 */
- (NSDate *)ll_begindayOfMonth;
+ (NSDate *)ll_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)ll_lastdayOfMonth;
+ (NSDate *)ll_lastdayOfMonth:(NSDate *)date;

/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)ll_dateAfterDay:(NSUInteger)day;
+ (NSDate *)ll_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回day月后的日期(若month为负数,则为|month|月前的日期)
 */
- (NSDate *)ll_dateAfterMonth:(NSUInteger)month;
+ (NSDate *)ll_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)ll_offsetYears:(int)numYears;
+ (NSDate *)ll_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)ll_offsetMonths:(int)numMonths;
+ (NSDate *)ll_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)ll_offsetDays:(int)numDays;
+ (NSDate *)ll_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)ll_offsetHours:(int)hours;
+ (NSDate *)ll_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;

/**
 * 距离该日期前几天
 */
- (NSUInteger)ll_daysAgo;
+ (NSUInteger)ll_daysAgo:(NSDate *)date;

/**
 *  获取星期几
 */
- (NSInteger)ll_weekday;
+ (NSInteger)ll_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 */
- (NSString *)ll_dayFromWeekday;
+ (NSString *)ll_dayFromWeekday:(NSDate *)date;

/**
 *  日期是否相等
 */
- (BOOL)ll_isSameDay:(NSDate *)anotherDate;

/**
 *  是否是今天
 */
- (BOOL)ll_isToday;

/**
 *  增加
 */
- (NSDate *)ll_dateByAddingDays:(NSUInteger)days;

/**
 *  获得NSString的月份
 */
+ (NSString *)ll_monthWithMonthNumber:(NSInteger)month;

/**
 * 获取指定月份的天数
 */
- (NSUInteger)ll_daysInMonth:(NSUInteger)month;
+ (NSUInteger)ll_daysInMonth:(NSDate *)date month:(NSUInteger)month;

/**
 * 获取当前月份的天数
 */
- (NSUInteger)ll_daysInMonth;
+ (NSUInteger)ll_daysInMonth:(NSDate *)date;

/**
 * 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 */
- (NSString *)ll_timeInfo;
+ (NSString *)ll_timeInfoWithDate:(NSDate *)date;
+ (NSString *)ll_timeInfoWithDateString:(NSString *)dateString;

/**
 * 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
 */
- (NSString *)ll_ymdFormat;
- (NSString *)ll_hmsFormat;
- (NSString *)ll_ymdHmsFormat;
+ (NSString *)ll_ymdFormat;
+ (NSString *)ll_hmsFormat;
+ (NSString *)ll_ymdHmsFormat;

/**
 获取当前时间戳（毫秒）

 @return 返回字符串时间戳
 */
+ (NSString *)ll_getNowTimeTimes;

/**
 获取十位时间戳秒

 @return string
 */
+ (NSString *)getNowTimeTimesSeconds;

/// self与传入的时间比较
/// @param date 传入时间
/// @return 比较的大小
- (LLDateCompare)ll_dateCompareWithDate:(NSDate *)date;
@end
