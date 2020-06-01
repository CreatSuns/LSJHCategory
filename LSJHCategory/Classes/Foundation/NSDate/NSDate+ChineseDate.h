//
//  NSDate+ChineseDate.h
//
//  Created by 李世航 on 2019/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ChineseDate)
+ (NSUInteger)ll_chineseYearWithDate:(NSDate *)date;
+ (NSUInteger)ll_chineseMouthWithDate:(NSDate *)date;
+ (NSUInteger)ll_chineseDayWithDate:(NSDate *)date;
- (NSUInteger)ll_chineseYear;
- (NSUInteger)ll_chineseMouth;
- (NSUInteger)ll_chineseDay;
@end

NS_ASSUME_NONNULL_END
