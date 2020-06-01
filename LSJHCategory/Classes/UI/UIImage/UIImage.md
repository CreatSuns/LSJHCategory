> Category

- 返回一张不超过屏幕尺寸的 image

```oc
/**
 返回一张不超过屏幕尺寸的 image

 @param image 图片
 @return 图片
 */
+ (UIImage * _Nullable)ll_ImageSizeWithScreenImage:(UIImage *_Nonnull)image;
```
- 返回一张不超过屏幕尺寸的 image

```oc
/**
 裁剪图片

 @param frame 裁剪区域
 @param angle 裁剪角度
 @param circular 是否是圆形裁剪
 @return image
 */
- (nonnull UIImage *)ll_croppedImageWithFrame:(CGRect)frame
                                        angle:(NSInteger)angle
                                 circularClip:(BOOL)circular;

```
- 返回一张不超过屏幕尺寸的 image

```oc
/**
 等比例缩放,size 是你要把图显示到 多大区域

 @param sourceImage 传入图片
 @param size 目标大小
 @return image
 */
+ (UIImage * _Nullable)ll_ImageCompressFitSizeScale:(UIImage * _Nonnull)sourceImage         targetSize:(CGSize)size;
```
> Source

- 获取开发包中的图片资源

```oc
/**
 获取开发包中的图片资源

 @param imageName 图片名
 @param className 类名
 @return image
 */
+ (UIImage * _Nonnull)ll_loadBundleImage:(NSString * _Nonnull)imageName
                               ClassName:(NSString * _Nonnull)className
                              bundleName:(NSString * _Nonnull)bundleName;
```
- 将颜色转化为图片

```oc
/**
 将颜色转化为图片

 @param color UIColor对象
 @return Image对象
 */
+ (UIImage * _Nullable)ll_createImageWithColor:(UIColor * _Nonnull)color;
```
-  根据url获取图片信息

```oc
/**
 根据url获取图片信息
 example :
 {
    ColorModel = RGB;
    DPIHeight = 72;
    DPIWidth = 72;
    Depth = 8;
    PixelHeight = 795;
    PixelWidth = 1200;
    "{JFIF}" =     {
        DensityUnit = 1;
        JFIFVersion = (
            1,
            0,
            1
        );
    XDensity = 72;
    YDensity = 72;
 };

 @param urlString url
 @return 信息
 */
+ (NSDictionary * _Nullable)ll_imageInfoWithUrl:(NSString * _Nullable)urlString;
```
- 加载SVG图片

```oc
/**
 加载SVG图片

 @param name 图片名
 @param size 大小
 @return image
 */
+ (UIImage * _Nullable)ll_svgImageName:(NSString * _Nullable)name
                                  size:(CGSize)size;
```
- 加载SVG图片

```oc
/**
 加载SVG图片

 @param name 图片名
 @param size 大小
 @param className NSStringFromClass(self.class)
 @return image
 */
+ (UIImage * _Nullable)ll_svgImageName:(NSString * _Nullable)name
                                  size:(CGSize)size
                             ClassName:(NSString * _Nullable)className;
```
- 获取视频第一帧图片

```oc
/**
 获取视频第一帧图片

 @param path 视频url
 @return image
 */
+ (UIImage * _Nullable)ll_getVideoPreViewImage:(NSURL * _Nullable)path;
```
- 返回一张可拉伸的图片

```oc
/// 返回一张可拉伸的图片
+ (UIImage * _Nullable)ll_resizeImageNamed:(NSString * _Nullable)name;
```
- 颜色生成图片是否需要切圆角

```oc
/**
 颜色生成图片是否需要切圆角

 @param color 颜色
 @param size 图片尺寸
 @param rate 圆角系数为0不切圆角
 @return 图片
 */
+ (UIImage * _Nullable)ll_imageWithColor:(UIColor * _Nullable)color
                                    size:(CGSize)size
                                    rate:(CGFloat)rate;
```
- 使用view生成一张图片

```oc
/**
 使用view生成一张图片

 @param view view
 @return image
 */
+ (UIImage * _Nullable)ll_createViewImage:(UIView * _Nullable)view;
```

> FixSource

- 修正图片方向

```oc
/**
 修正图片方向

 @param orient 设置方向
 @return image
 */
- (UIImage *)ll_rotate:(UIImageOrientation)orient;
```

> QRCode

- 生成一张普通的二维码

```oc
/**
 生成一张普通的二维码

 @param data 传入数据
 @param imageViewWidth 图片宽度
 @return 返回一张二维码图片
 */
+ (UIImage *)ll_GenerateWithDefaultQRCodeData:(NSString *)data
                               imageViewWidth:(CGFloat)imageViewWidth;
```
- 生成一张带有动态或静态logo的二维码

```oc
/// 生成一张带有动态或静态logo的二维码
/// @param data 传入数据
/// @param logoImage 图片
/// @param logoImageName 静态图片名
/// @param logoScaleToSuperView 相对于父视图的缩放比取值范围0-1；0，不显示，1，代表与父视图大小相同(适当调整相应的比例，否则扫描不出结果)
+ (UIImage *)ll_GenerateWithLogoQRCodeData:(NSString *)data
                                 logoImage:(UIImage * _Nullable)logoImage
                             logoImageName:(NSString * _Nullable)logoImageName
                      logoScaleToSuperView:(CGFloat)logoScaleToSuperView;
```
- 生成一张彩色的二维码

```oc
/**
 生成一张彩色的二维码

 @param data 传入数据
 @param backgroundColor 背景颜色
 @param mainColor 主色
 @return 返回一张二维码图片
 */
+ (UIImage *)ll_GenerateWithColorQRCodeData:(NSString *)data
                            backgroundColor:(CIColor *)backgroundColor
                                  mainColor:(CIColor *)mainColor;
```
- 生成条形码

```oc
/**
 生成条形码（原生只支持ios8.0以后）

 @param content 内容
 @param size 大小
 @param red 色值
 @param green 色值
 @param blue 色值
 @return 图片
 */
+ (UIImage *)ll_BarcodeImageWithContent:(NSString *)content
                          codeImageSize:(CGSize)size
                                    red:(CGFloat)red
                                  green:(CGFloat)green
                                   blue:(CGFloat)blue;
```


