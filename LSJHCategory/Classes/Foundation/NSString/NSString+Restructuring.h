//
//  NSString+Restructuring.h
//
//  Created by 李世航 on 2019/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Restructuring)
/**
 电话号码中间4位*显示

 @param phoneNum 电话号码
 @return 135****2262
 */
+ (NSString *)ll_getSecrectStringWithPhoneNumber:(NSString *)phoneNum;

/**
 银行卡号中间8位*显示

 @param accountNo 银行卡号
 @return string
 */
+ (NSString *)ll_getSecrectStringWithAccountNo:(NSString *)accountNo;

/**
 转为手机格式，默认为-

 @param mobile 手机号
 @return 格式化的手机号
 */
+ (NSString *)ll_stringMobileFormat:(NSString *)mobile;

/**
 去掉前后空格

 @return string
 */
- (NSString *)ll_trimmedString;

/**
 去除空格

 @return string
 */
- (NSString *)ll_trimmingWhitespace;

/**
 去除空格与空行

 @return string
 */
- (NSString *)ll_trimmingWhitespaceAndNewlines;

/**
 抹除小数末尾的0

 @return string
 */
- (NSString *)ll_removeUnwantedZero;

/**
 生成随机字符串

 @param len 字符串长度
 @return 返回一个随机字符串
 */
+ (NSString *)ll_randomStringWithLength:(NSInteger)len;

@end

@interface NSString (RestructuringUrl)
/**
 根据Url规则重组字符串

 @param urlString urlString
 @return 字典
 */
+ (NSDictionary *)ll_breakupUrlStringFetchParams:(NSString *)urlString;
@end

NS_ASSUME_NONNULL_END
