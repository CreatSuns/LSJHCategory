

> Category

- 数组转成json 字符串

```objective-c
- (NSString *)ll_transToJSONString;
```
- 反转数组

```oc
- (NSArray *)ll_reverseArray;
```

> Safe

- 保证该对象不为nil

```objective-c
+ (instancetype)ll_safeArrayWithObject:(id)object;
```
- 安全的取出数组下标对应的元素，可以防止越界

```oc
- (id)ll_safeObjectAtIndex:(NSUInteger)index;
```
- 截取数组元素

```oc
- (NSArray *)ll_safeSubarrayWithRange:(NSRange)range;
```

- 保证安全的获得一个元素的index

```oc
- (NSUInteger)ll_safeIndexOfObject:(id)anObject;
```
> Sudoku

- 九宫格布局 固定ItemSize 可变ItemSpacing

```objective-c
- (void)ll_mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                    fixedItemHeight:(CGFloat)fixedItemHeight
                                          warpCount:(NSInteger)warpCount
                                         topSpacing:(CGFloat)topSpacing
                                      bottomSpacing:(CGFloat)bottomSpacing
                                        leadSpacing:(CGFloat)leadSpacing
                                        tailSpacing:(CGFloat)tailSpacing;
```
- 九宫格布局 可变ItemSize 固定ItemSpacing

```oc
- (void)ll_mas_distributeSudokuViewsWithFixedLineSpacing:(CGFloat)fixedLineSpacing
                                fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                            warpCount:(NSInteger)warpCount
                                           topSpacing:(CGFloat)topSpacing
                                        bottomSpacing:(CGFloat)bottomSpacing
                                          leadSpacing:(CGFloat)leadSpacing
                                          tailSpacing:(CGFloat)tailSpacing;
```
- 九宫格布局 固定ItemSize 固定ItemSpacing。可由九宫格的内容控制SuperView的大小。如果warpCount大于[self count]，该方法将会用空白的View填充到superview中

```oc
- (NSArray *)ll_mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
                                             fixedItemHeight:(CGFloat)fixedItemHeight
                                            fixedLineSpacing:(CGFloat)fixedLineSpacing
                                       fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                                   warpCount:(NSInteger)warpCount
                                                  topSpacing:(CGFloat)topSpacing
                                               bottomSpacing:(CGFloat)bottomSpacing
                                                 leadSpacing:(CGFloat)leadSpacing
                                                 tailSpacing:(CGFloat)tailSpacing;
```

- 特殊的布局方式（一行或者一列）

```oc
- (NSArray *)ll_mas_distributeSpecialSudokuViewsWithFixedItemWidths:(NSArray<NSNumber*>*)fixedItemWidths
                                                    fixedItemHeights:(NSArray<NSNumber*>*)fixedItemHeights
                                                    fixedLineSpacing:(CGFloat)fixedLineSpacing
                                               fixedInteritemSpacing:(CGFloat)fixedInteritemSpacing
                                                           warpCount:(NSInteger)warpCount
                                                          topSpacing:(CGFloat)topSpacing
                                                       bottomSpacing:(CGFloat)bottomSpacing
                                                         leadSpacing:(CGFloat)leadSpacing
                                                         tailSpacing:(CGFloat)tailSpacing;
```

