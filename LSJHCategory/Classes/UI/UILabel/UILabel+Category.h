//
//  UILabel+Category.h
//
//  Created by 李世航 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Category)

/**
 label文字顶部对齐
 */
- (void)ll_alignTop;

/**
 label文字底部对齐
 */
- (void)ll_alignBottom;

/**
 改变行间距

 @param space 间距
 @param labelText 文字
 */
- (void)ll_changeLineSpaceForLabelWithSpace:(float)space
                                       text:(NSString *)labelText;

/**
 改变字间距

 @param space 间距
 */
- (void)ll_changeWordSpaceForLabelWithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (void)ll_changeSpaceForLabelWithLineSpace:(float)lineSpace
                                  WordSpace:(float)wordSpace;

/**
 获得UILabel高度

 @param width 宽度
 @param title title
 @param font font
 @return 返回高度
 */
+ (CGFloat)ll_getHeightByWidth:(CGFloat)width
                         title:(NSString *)title
                          font:(UIFont *)font;

/**
 获得UILabel宽度

 @param title title
 @param font fon
 @return 返回宽度
 */
+ (CGFloat)ll_getWidthWithTitle:(NSString *)title
                           font:(UIFont *)font;

@end
