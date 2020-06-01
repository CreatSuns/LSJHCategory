> Catagory

- 使用block方式添加按钮回调（可以设置点击方式）

```oc
/// 使用block方式添加按钮回调（可以设置点击方式）
/// @param action 回调
/// @param controlEvents 点击方式
- (void)addCallBackAction:(ButtonActionCallBack _Nullable )action
         forControlEvents:(UIControlEvents)controlEvents
```

- 使用block方式添加按钮回调

```oc
/// 使用block方式添加按钮回调
/// @param action 回调
- (void)addCallBackAction:(ButtonActionCallBack _Nullable )action;
```

- 设置按钮的帧动画

```oc
/// 设置按钮的帧动画
/// @param source 图片数组
- (void)ll_gifImageWithSource:(NSArray<UIImage *> *_Nonnull)source;
```

- 设置按钮背景色

```
/**
 设置背景色

 @param color 颜色
 @param state state
 */
- (void)ll_setBackgroundColor:(nullable UIColor *)color forState:(UIControlState)state;
```

> EnlargeTouchArea

- 扩大 UIButton 的點擊範圍,控制上下左右的延長範圍

```oc
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
```

- 设置图片在右，需先指定button.frame

```oc
/**
 设置图片在右，需先指定button.frame

 @param space 间距
 */
- (void)ll_setButtonImageLoctionRightWithSpace:(CGFloat)space;
```

- 设置图片在上，需先指定button.frame

```oc
/**
 设置图片在上，需先指定button.frame

 @param space 间距
 */
- (void)ll_setButtonImageLocationTopWithSpace:(CGFloat)space;
```

- 设置图片在下，需先指定button.frame

```oc
/**
 设置图片在下，需先指定button.frame

 @param space 间距
 */
- (void)ll_setButtonImageLocationBottomWithSpace:(CGFloat)space;
```

> Property


| Block | 描述 |
| --- | --- |
| UIButton * _Nonnull (^_Nullable setupTitle)(NSString * _Nullable text) | 设置按钮标题 |
| UIButton * _Nonnull (^_Nullable setupSystemFontSize)(CGFloat fontSize) | 设置按钮文字大小 |
| UIButton * _Nonnull (^_Nullable setupTextColor)(UIColor * _Nullable color, UIControlState state); | 设置按钮文字颜色 |
| UIButton * _Nonnull (^_Nullable setupBackgroundColor)(UIColor * _Nullable color) | 设置按钮背景颜色 |
| UIButton * _Nonnull (^_Nullable setupImage)(NSString * _Nullable imageName, UIControlState state) | 设置按钮图片 |
| UIButton * _Nonnull (^_Nullable setupBackgroundImage)(UIImage * _Nullable image, UIControlState state) | 设置背景图片 |
| UIButton * _Nonnull (^_Nullable setupSelected)(BOOL selected) | 设置是否被选中 |
| UIButton * _Nonnull (^_Nullable setupHorizontalAlignment)(UIControlContentHorizontalAlignment alignment) | 设置水平方向对齐方式 |
| UIButton * _Nonnull (^_Nullable setupVerticalAlignment)(UIControlContentVerticalAlignment alignment) | 设置垂直方向对齐方式 |
| UIButton * _Nonnull (^_Nullable setupTitleEdgeInsets)(UIEdgeInsets edge) | 设置文字边距 |
| UIButton * _Nonnull (^_Nullable setupImageEdgeInsets)(UIEdgeInsets edge) | 设置图片边距 |
| UIButton * _Nonnull (^_Nullable setupAttributedTitle)(NSAttributedString * _Nullable title) | 设置富文本 |
| UIButton * _Nonnull (^_Nullable setupUserInteractionEnabled)(BOOL enable) | 设置是否关闭用户交互 |



