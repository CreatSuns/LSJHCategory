//
//  UITextView+PlaceHolder.h

#import <UIKit/UIKit.h>

@interface UITextView (PlaceHolder)
/** 
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString * ll_placeHolder;
/** 
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString * placeholder;
/** 
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor * ll_placeHolderColor;

@end
