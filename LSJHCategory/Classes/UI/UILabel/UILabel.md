> Category

- label文字顶部对齐

```oc
/**
 label文字顶部对齐
 */
- (void)ll_alignTop;
```

- label文字底部对齐

```oc
/**
 label文字底部对齐
 */
- (void)ll_alignBottom;
```

- 改变行间距

```oc
/**
 改变行间距

 @param space 间距
 @param labelText 文字
 */
- (void)ll_changeLineSpaceForLabelWithSpace:(float)space
                                       text:(NSString *)labelText;
```

- 改变字间距

```oc
/**
 改变字间距

 @param space 间距
 */
- (void)ll_changeWordSpaceForLabelWithSpace:(float)space;
```

- 改变行间距和字间距

```oc
/**
 *  改变行间距和字间距
 */
- (void)ll_changeSpaceForLabelWithLineSpace:(float)lineSpace
                                  WordSpace:(float)wordSpace;
```

- 获得UILabel高度

```oc
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
```

- 获得UILabel宽度

```oc
/**
 获得UILabel宽度

 @param title title
 @param font fon
 @return 返回宽度
 */
+ (CGFloat)ll_getWidthWithTitle:(NSString *)title
                           font:(UIFont *)font;
```

> Property


| 属性 | 注释 |
| --- | --- |
| UILabel * (^ setupText)(NSString * text) | 设置标题 |
| UILabel * (^ setupTextColor)(UIColor * color) | 设置标题颜色 |
| UILabel * (^ setupSystemFontSize)(CGFloat fontSize) | 设置标题大小 |
| UILabel * (^ setupAlignment)(NSTextAlignment alignment) | 设置文本对齐方式 |
| UILabel * (^ setupNumberOfLines)(NSInteger lines) | 设置行数 |
| UILabel * (^ setupLineSpace)(CGFloat space) | 设置行间距 |
| UILabel * (^ setupUserInteractionEnabled)(BOOL enable) | 设置用户交互性 |
| UILabel * (^ setupBaselineAdjustment)(UIBaselineAdjustment alignment) | 设置文本纵向对齐方式 |


