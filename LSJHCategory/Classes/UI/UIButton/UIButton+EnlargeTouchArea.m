//
//  UIButton+EnlargeTouchArea.m
//  LSJHCategory
//
//  Created by 李世航 on 2020/5/30.
//

#import "UIButton+EnlargeTouchArea.h"

@implementation UIButton (EnlargeTouchArea)
static char topNameKey;
static char rightNameKey;
static char bottomNameKey;
static char leftNameKey;

- (void)setEnlargeEdgeWithTop:(CGFloat)top
                        right:(CGFloat)right
                       bottom:(CGFloat)bottom
                         left:(CGFloat)left
{
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left],
                             OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargedRect
{
    NSNumber * topEdge    = objc_getAssociatedObject(self, &topNameKey);
    NSNumber * rightEdge  = objc_getAssociatedObject(self, &rightNameKey);
    NSNumber * bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber * leftEdge   = objc_getAssociatedObject(self, &leftNameKey);
    if (topEdge && rightEdge && bottomEdge && leftEdge) {
        return CGRectMake(self.bounds.origin.x - leftEdge.floatValue,
                          self.bounds.origin.y - topEdge.floatValue,
                          self.bounds.size.width + leftEdge.floatValue + rightEdge.floatValue,
                          self.bounds.size.height + topEdge.floatValue + bottomEdge.floatValue);
    } else {
        return self.bounds;
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    CGRect rect = [self enlargedRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super hitTest:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point) ? self : nil;
}

- (void)ll_setButtonImageLoctionRightWithSpace:(CGFloat)space
{
    [self.superview layoutIfNeeded];
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;

    CGFloat labelWidth = 0.0;

    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space, 0, -labelWidth - space);
    labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith - space, 0, imageWith + space);

    [self setTitleEdgeInsets:labelEdgeInsets];
    [self setImageEdgeInsets:imageEdgeInsets];
}

- (void)ll_setButtonImageLocationTopWithSpace:(CGFloat)space
{
    [self.superview layoutIfNeeded];
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith   = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;

    CGFloat labelWidth  = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth  = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth  = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space, 0, 0, -labelWidth);
    labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight - space, 0);

    [self setTitleEdgeInsets:labelEdgeInsets];
    [self setImageEdgeInsets:imageEdgeInsets];
}

- (void)ll_setButtonImageLocationBottomWithSpace:(CGFloat)space
{
    [self.superview layoutIfNeeded];
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith   = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;

    CGFloat labelWidth  = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth  = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth  = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }

    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;

    imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space, -labelWidth);
    labelEdgeInsets = UIEdgeInsetsMake(-imageHeight - space, -imageWith, 0, 0);

    [self setTitleEdgeInsets:labelEdgeInsets];
    [self setImageEdgeInsets:imageEdgeInsets];
}
@end
