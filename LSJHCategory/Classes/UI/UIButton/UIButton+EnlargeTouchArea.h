//
//  UIButton+EnlargeTouchArea.h
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (EnlargeTouchArea)

/**
 *  扩大 UIButton 的點擊範圍
 *  控制上下左右的延長範圍
 *
 *  @param top    顶部
 *  @param right  右边
 *  @param bottom 底部
 *  @param left   左边
 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left;

/**
 设置图片在右，需先指定button.frame

 @param space 间距
 */
- (void)ll_setButtonImageLoctionRightWithSpace:(CGFloat)space;

/**
 设置图片在上，需先指定button.frame

 @param space 间距
 */
- (void)ll_setButtonImageLocationTopWithSpace:(CGFloat)space;

/**
 设置图片在下，需先指定button.frame

 @param space 间距
 */
- (void)ll_setButtonImageLocationBottomWithSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
