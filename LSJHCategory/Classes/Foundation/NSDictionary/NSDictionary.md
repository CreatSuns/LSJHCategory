# NSDictionary

## 说明
- 对NSDictionary进行了扩展

## NSDictionary+Category

```objective-c
/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)ll_TransToJSONString;
```

## NSDictionary+Safe

```objective-c
/**
 通过key获取Value值

 @param key key
 @return value
 */
- (id)ll_safeObjectForKey:(NSString *)key;

/**
 key-value方式设置dict

 @param object value
 @param key key
 */
- (void)ll_safeSetValue:(id)object forKey:(id)key;

- (id)ll_objectForKeyCustom:(id)aKey;

/**
 value获取key

 @param value value
 @return key
 */
- (id)ll_safeKeyForValue:(id)value;
```

## NSMutableDictionary+Safe

```objective-c
- (void)ll_safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)ll_safeObjectForKey:(id<NSCopying>)aKey;
```

