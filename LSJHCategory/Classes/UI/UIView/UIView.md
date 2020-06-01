> Layout

 属性 | 说明 | 类型 | 默认值
 --- | --- | --- | ---
cmam_left|视图左侧|CGFloat|-
cmam_top|视图顶部|CGFloat|-
cmam_right|视图右侧|CGFloat|-
cmam_bottom|视图底部|CGFloat|-
cmam_width|视图宽度|CGFloat|-
cmam_height|视图高度|CGFloat|-
cmam_centerX|X轴中心点|CGFloat|-cmam_centerY|Y轴中心点|CGFloat|-
cmam_origin|x\y坐标点|CGPoint|-
cmam_size|W\H宽高尺寸|CGSize|-
cmam_viewController|father控制器|UIViewController|-
cmam_visibleAlpha|返回屏幕上可见的alpha|CGFloat|-

- 根据当前view生成图片

```objective-c
- (nullable UIImage *)cmam_snapshotImage;
```

```oc
/**
 Create a snapshot image of the complete view hierarchy.
 @discussion It's faster than "snapshotImage", but may cause screen updates.
 See -[UIView drawViewHierarchyInRect:afterScreenUpdates:] for more information.
 */
- (nullable UIImage *)cmam_snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
```

```oc
/**
 Create a snapshot PDF of the complete view hierarchy.
 */
- (nullable NSData *)cmam_snapshotPDF;
```

```oc
/**
 Shortcut to set the view.layer's shadow
 
 @param color  Shadow Color
 @param offset Shadow offset
 @param radius Shadow radius
 */
- (void)cmam_setLayerShadow:(nullable UIColor *)color offset:(CGSize)offset radius:(CGFloat)radius;
```
```oc
/**
 Remove all subviews.
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)cmam_removeAllSubviews;
```

```oc
- /**
 Converts a point from the receiver's coordinate system to that of the specified view or window.
 
 @param point A point specified in the local coordinate system (bounds) of the receiver.
 @param view  The view or window into whose coordinate system point is to be converted.
 If view is nil, this method instead converts to window base coordinates.
 @return The point converted to the coordinate system of view.
 */
- (CGPoint)cmam_convertPoint:(CGPoint)point toViewOrWindow:(nullable UIView *)view;
```

```oc
/**
 Converts a point from the coordinate system of a given view or window to that of the receiver.
 
 @param point A point specified in the local coordinate system (bounds) of view.
 @param view  The view or window with point in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The point converted to the local coordinate system (bounds) of the receiver.
 */
- (CGPoint)cmam_convertPoint:(CGPoint)point fromViewOrWindow:(nullable UIView *)view;
```

```oc
/**
 Converts a rectangle from the receiver's coordinate system to that of another view or window.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of the receiver.
 @param view The view or window that is the target of the conversion operation. If view is nil, this method instead converts to window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)cmam_convertRect:(CGRect)rect toViewOrWindow:(nullable UIView *)view;
```

```oc
/**
 Converts a rectangle from the coordinate system of another view or window to that of the receiver.
 
 @param rect A rectangle specified in the local coordinate system (bounds) of view.
 @param view The view or window with rect in its coordinate system.
 If view is nil, this method instead converts from window base coordinates.
 @return The converted rectangle.
 */
- (CGRect)cmam_convertRect:(CGRect)rect fromViewOrWindow:(nullable UIView *)view;
+ (void)cmam_showOscillatoryAnimationWithLayer:(CALayer * _Nullable)layer type:(CMAMOscillatoryAnimationType)type;
```
- 设置部分圆角(绝对布局)

```oc
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
```
- 设置部分圆角(相对布局)

```oc
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;
```
- 获取view所在的控制器

```oc                
- (UIViewController *)cmam_parentController;
```
- 获取view所在的控制器

```oc
+ (UIViewController *)cmam_currentViewConrtoller;
                 
```
 
> Toast 

- 位于底部的toast提示框

```oc
+ (void)ll_showBottomToastWithMessage:(NSString *)message;
```

- 位于底部的toast提示框,是否可以点击背景取消

```oc
+ (void)ll_showBottomToastWithMessage:(NSString *)message bgViewUserInteractionUse:(BOOL)use;
```

- 位于屏幕中心的提示框

```oc
+ (void)ll_showCenterToastWithMessage:(NSString *)message;
```

- 位于屏幕中心的提示框,是否可以点击背景取消

```oc
+ (void)ll_showCenterToastWithMessage:(NSString *)message bgViewUserInteractionUse:(BOOL)use;
```

- 图片提示框

```oc
+ (void)ll_showToastImage:(NSString *)imageString
             autoRotation:(BOOL)autoRotation
                ImageType:(LLToastImageType)imageType
        sourceInKitBundle:(BOOL)isSource
              autoDismiss:(BOOL)autoDismiss;
```

- 显示成功的提示框

```oc
+ (void)ll_successToastWithMessage:(NSString *)message;
```

- 显示失败的提示框

```oc
+ (void)ll_failToastWithMessage:(NSString *)message;
```

- 显示警告的提示框

```oc
+ (void)ll_warningToastWithMessage:(NSString *)message;
```

- 图片加文字的提示框

```oc
+ (void)ll_toastWithMessage:(NSString *)message
                imageString:(NSString *)imageString
               autoRotation:(BOOL)autoRotation
                  imageType:(LLToastImageType)imageType
          sourceInKitBundle:(BOOL)isSource
                autoDismiss:(BOOL)autoDismiss
   bgViewUserInteractionUse:(BOOL)use;
```

- 请和ll_toastWithMessage配合使用

```oc
+ (void)ll_dismissToast;
```

> Animation

- 添加旋转动画

```oc
- (void)ll_setRotationAnimation:(CGFloat)angle
                           time:(CGFloat)time
                    repeatCount:(NSUInteger)repeat;
```

- 移除旋转动画

```oc
- (void)ll_removeRotationAnimation;
```

- x

```oc
- (void)ll_setFlipAnimation;
```

> Gestures

- 添加点击手势

```oc
- (void)ll_AddTapGesturesWithTapStyle:(LLTapGesturesStyle)tapStyle
                            TapHandle:(void (^)(UITapGestureRecognizer * gesture))handle;
```

- 添加长按手势

```oc
- (void)ll_AddLongPressGestureWithDuration:(NSTimeInterval)duration
                                    Handle:
                                     (void (^)(UILongPressGestureRecognizer * gesture))handle;
```

- 添加平移手势

```oc
- (void)ll_AddPanGestureWithHandle:(void (^)(UIPanGestureRecognizer * gesture))handle;
```

- 添加轻扫手势

```oc
- (void)ll_AddSwipeGestureWithSwipeDirection:(UISwipeGestureRecognizerDirection)direction
                                 SwipeHandle:(void (^)(UISwipeGestureRecognizer * gesture))handle;
```

- 添加旋转手势

```oc
- (void)ll_AddRotationGestureWithHandle:(void (^)(UIRotationGestureRecognizer * gesture))handle;
```

- 添加捏合手势

```oc
- (void)ll_AddPinchGestureWithHandle:(void (^)(UIPinchGestureRecognizer * gesture))handle;
```

