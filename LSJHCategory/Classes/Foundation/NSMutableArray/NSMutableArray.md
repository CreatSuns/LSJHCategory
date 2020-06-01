> Safe

- 添加对象

```objective-c
- (void)ll_safeAddObject:(id)object;
```

- 在某个位置插入对象

```oc
- (void)ll_safeInsertObject:(id)object atIndex:(NSUInteger)index;
```

- 在多个位置上插入一个数组

```oc
- (void)ll_safeInsertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexs;
```

- 移除某个位置的元素

```oc
- (void)ll_safeRemoveObjectAtIndex:(NSUInteger)index;
```

- 移除某个区间的元素

```oc
- (void)ll_safeRemoveObjectsInRange:(NSRange)range;
```

- 替换某个位置的元素

```oc
- (void)ll_safeReplaceObjectAtIndex:(NSUInteger)index withObject:(id)object;
```

