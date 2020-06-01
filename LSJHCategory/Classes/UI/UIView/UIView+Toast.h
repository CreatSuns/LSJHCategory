//
//  UIView+Toast.h
//
//  Created by 李世航 on 2018/11/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LLToastImageType) {
    LLToastImageTypePNG,
    LLToastImageTypeJPEG,
    LLToastImageTypeSVG,
    LLToastImageTypeGIF,
};

@interface UIView (Toast)

/**
 位于底部的toast提示框

 @param message 信息
 */
+ (void)ll_showBottomToastWithMessage:(NSString *)message;

/**
 位于底部的toast提示框

 @param message 信息
 @param use 底部视图用户交互是否打开
 */
+ (void)ll_showBottomToastWithMessage:(NSString *)message
             bgViewUserInteractionUse:(BOOL)use;

/**
 位于屏幕中心的提示框

 @param message 信息
 */
+ (void)ll_showCenterToastWithMessage:(NSString *)message;

/**
 位于屏幕中心的提示框

 @param message 信息
 @param use 底部视图用户交互是否打开
 */
+ (void)ll_showCenterToastWithMessage:(NSString *)message
             bgViewUserInteractionUse:(BOOL)use;
/**
 图片提示框

 @param imageString 图片名
 @param autoRotation 是否自动旋转
 @param imageType 图片类型
 @param isSource 是否是资源库文件（外部调用此值传NO）
 @param autoDismiss 是否自动隐藏
 */
+ (void)ll_showToastImage:(NSString *)imageString
             autoRotation:(BOOL)autoRotation
                ImageType:(LLToastImageType)imageType
        sourceInKitBundle:(BOOL)isSource
              autoDismiss:(BOOL)autoDismiss;

/**
 显示成功的提示框

 @param message 信息
 */
+ (void)ll_successToastWithMessage:(NSString *)message;

/**
 显示失败的提示框

 @param message 信息
 */
+ (void)ll_failToastWithMessage:(NSString *)message;

/**
 显示警告的提示框

 @param message 信息
 */
+ (void)ll_warningToastWithMessage:(NSString *)message;

/**
 图片加文字的提示框

 @param message 信息
 @param imageString 图片名
 @param autoRotation 自动旋转（仅在LLToastImageTypePNG有效）
 @param imageType 图片类型
 @param isSource 是否是Kit库的图片
 @param autoDismiss 是否需要自动消失
 */
+ (void)ll_toastWithMessage:(NSString *)message
                imageString:(NSString *)imageString
               autoRotation:(BOOL)autoRotation
                  imageType:(LLToastImageType)imageType
          sourceInKitBundle:(BOOL)isSource
                autoDismiss:(BOOL)autoDismiss
   bgViewUserInteractionUse:(BOOL)use;

/**
 请和ll_toastWithMessage配合使用
 */
+ (void)ll_dismissToast;
@end

NS_ASSUME_NONNULL_END
