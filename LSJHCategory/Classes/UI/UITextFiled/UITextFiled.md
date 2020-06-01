> Category

- 设置placeholder可以定制颜色字体大小

```oc
- (void)ll_setPlaceholedr:(NSString *)placeholedr
                    color:(UIColor *)color
                     font:(CGFloat)font;
```

- 设置左视图文字

```oc
- (void)ll_setLeftViewWithText:(NSString *)text
                     textColor:(UIColor *)color
                          font:(CGFloat)font;
```

- 设置左视图图片

```oc
- (void)ll_setLeftViewImageWithImageNamed:(NSString *)imageNamed;
- (void)ll_setLeftViewWithView:(UIView *)view;
```

- 设置右视图图片

```oc
- (void)ll_setRightViewImageWithImageNamed:(NSString *)imageNamed;
- (void)ll_setRightButtonWithView:(UIButton *)button;
```

- 设置下划线样式的textFiled

```oc
- (void)ll_setTextFiledTypeStyleLineWithColor:(UIColor *)color;
```

- 设置用户名输入框

```oc
- (void)ll_setUserNameTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor;
```

- 设置密码输入框

```oc
- (void)ll_setPasswordTextFiledTextColor:(UIColor *)color
                                 FontSize:(CGFloat)font
                          backGroundColor:(UIColor *)backGroundColor;
```

> Action

- 输入框绑定事件

```oc
- (void)ll_addTextChangeWithEvent:(UIControlEvents)event
                        textHandle:(void (^)(UITextField * text))textHandle;
```

> Property


| 属性 | 注释 |
| --- | --- |
| UITextField * (^setupText)(NSString * text) | 设置文本 |
| UITextField * (^setupTextColor)(UIColor * textColor) | 设置文本颜色 |
| UITextField * (^setupSystemFontSize)(CGFloat fontSize) | 设置文本字体大小 |
| UITextField * (^setupTextAlignment)(NSTextAlignment alignment) | 设置文本对齐方式 |
| UITextField * (^setupPlaceholder)(NSString * text) | 设置占位文字 |
| UITextField * (^setupKeyBoardType)(UIKeyboardType type) | 设置键盘类型 |
| UITextField * (^setupBorderStyle)(UITextBorderStyle style) | 设置边框类型 |
| UITextField * (^setupSecureTextEntry)(BOOL isSecure) | 设置是否加密输入 |
| UITextField * (^setupClearsOnBeginEditing)(BOOL clear) | 设置是否在输入时显示删除按钮 |
| UITextField * (^setupDelegate)(id obj) | 设置代理 |
| UITextField * (^setupClearButtonMode)(UITextFieldViewMode mode) | 设置清除按钮模式 |
| UITextField * (^setupLeftView)(UIView * view) | 设置左侧视图 |
| UITextField * (^setupLeftViewMode)(UITextFieldViewMode mode) | 设置左侧视图显示模式 |
| UITextField * (^setupRightView)(UIView * view) | 设置右侧视图 |
| UITextField * (^setupRightViewMode)(UITextFieldViewMode mode) | 设置右侧视图显示模式 |


