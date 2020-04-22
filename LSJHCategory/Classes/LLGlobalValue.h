//
//  LLGlobalValue.h
//  LLCategory
//
//  Created by 李世航 on 2020/4/21.
//

#ifndef LLGlobalValue_h
#define LLGlobalValue_h

// **********************RGBColor*************************
#define WYA_RGB_COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 随机色
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
// **********************字体大小*************************
/**
 *字体大小
 */
#define FONT(s) [UIFont systemFontOfSize:(s*SizeAdapter)]
//粗体
#define FONTS(s) [UIFont boldSystemFontOfSize:(s*SizeAdapter)]
// **********************物理尺寸 以及比例 *************************
// 以iPhone6为基准尺寸
#define SizeAdapter ScreenWidth/375
//获取设备的物理高度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//获取设备的物理宽度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽高
#define ScreenBounds [UIScreen mainScreen].bounds

#define WYAiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define RectStatus  [[UIApplication sharedApplication] statusBarFrame]

#define WYAStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height

#define WYANavBarHeight 44.0

#define WYATabBarHeight (WYAStatusBarHeight > 20 ? 83 : 49)

#define WYABottomHeight (WYAStatusBarHeight > 20 ? 34 : 0)

#define WYATopHeight (WYAStatusBarHeight + WYANavBarHeight)

// **********************弱引用强引用*************************
#define WeakSelf(weakSelf)      __weak __typeof(&*self)    weakSelf  = self;
#define StrongSelf(strongSelf)  __strong __typeof(&*self) strongSelf = weakSelf;
// **********************获取window*************************
#define Window                  ([UIApplication sharedApplication].keyWindow)
// **********************打印*************************
#ifdef DEBUG
#define NSLog(format, ...) fprintf(stderr, "\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(format, ...) nil
#endif

#endif /* LLGlobalValue_h */
