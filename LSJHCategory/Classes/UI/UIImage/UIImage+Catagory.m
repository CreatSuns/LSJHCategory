//
//  UIImage+Image.m
//  QRCodeDemo
//
//  Created by 李世航 on 2018/6/13.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UIImage+Catagory.h"
#import <AVFoundation/AVFoundation.h>
#import <ImageIO/ImageIO.h>


@implementation UIImage (Catagory)

+ (UIImage *)ll_ImageSizeWithScreenImage:(UIImage *)image
{
    CGFloat imageWidth  = image.size.width;
    CGFloat imageHeight = image.size.height;

    if (imageWidth <= ScreenWidth && imageHeight <= ScreenHeight) {
        return image;
    }

    CGFloat max   = MAX(imageWidth, imageHeight);
    CGFloat scale = max / (ScreenHeight * 2.0);

    CGSize size = CGSizeMake(imageWidth / scale, imageHeight / scale);
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}

- (BOOL)hasAlpha
{
    CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(self.CGImage);
    return (alphaInfo == kCGImageAlphaFirst || alphaInfo == kCGImageAlphaLast ||
            alphaInfo == kCGImageAlphaPremultipliedFirst ||
            alphaInfo == kCGImageAlphaPremultipliedLast);
}

- (UIImage *)ll_croppedImageWithFrame:(CGRect)frame
                                 angle:(NSInteger)angle
                          circularClip:(BOOL)circular
{
    UIImage * croppedImage = nil;
    UIGraphicsBeginImageContextWithOptions(frame.size, ![self hasAlpha] && !circular, self.scale);
    {
        CGContextRef context = UIGraphicsGetCurrentContext();

        if (circular) {
            CGContextAddEllipseInRect(context, (CGRect){CGPointZero, frame.size});
            CGContextClip(context);
        }

        // To conserve memory in not needing to completely re-render the image re-rotated,
        // map the image to a view and then use Core Animation to manipulate its rotation
        if (angle != 0) {
            UIImageView * imageView             = [[UIImageView alloc] initWithImage:self];
            imageView.layer.minificationFilter  = kCAFilterNearest;
            imageView.layer.magnificationFilter = kCAFilterNearest;
            imageView.transform =
            CGAffineTransformRotate(CGAffineTransformIdentity, angle * (M_PI / 180.0f));
            CGRect rotatedRect = CGRectApplyAffineTransform(imageView.bounds, imageView.transform);
            UIView * containerView =
            [[UIView alloc] initWithFrame:(CGRect){CGPointZero, rotatedRect.size}];
            [containerView addSubview:imageView];
            imageView.center = containerView.center;
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [containerView.layer renderInContext:context];
        } else {
            CGContextTranslateCTM(context, -frame.origin.x, -frame.origin.y);
            [self drawAtPoint:CGPointZero];
        }

        croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    }
    UIGraphicsEndImageContext();

    return [UIImage imageWithCGImage:croppedImage.CGImage
                               scale:self.scale
                         orientation:UIImageOrientationUp];
}

+ (UIImage *)ll_ImageCompressFitSizeScale:(UIImage *)sourceImage targetSize:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [sourceImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

@end

@implementation UIImage (Source)

+ (UIImage *)ll_loadBundleImage:(NSString *)imageName ClassName:(NSString *)className bundleName:(NSString *)bundleName
{
    NSString * bundleNameCopy = [NSString stringWithFormat:@"/%@.bundle", bundleName];
    NSString * bundlePath = [[NSBundle bundleForClass:NSClassFromString(className)]
                             .resourcePath stringByAppendingPathComponent:bundleNameCopy];
    NSBundle * resource_bundle = [NSBundle bundleWithPath:bundlePath];
    UIImage * image =
    [UIImage imageNamed:imageName
                         inBundle:resource_bundle
    compatibleWithTraitCollection:nil];
    return image;
}

+ (UIImage *)ll_createImageWithColor:(UIColor * _Nonnull)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);

    CGContextFillRect(context, rect);

    UIImage * tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tempImage;
}

+ (NSDictionary *)ll_imageInfoWithUrl:(NSString *)urlString
{
    CGImageSourceRef imgSrc = CGImageSourceCreateWithURL((__bridge CFURLRef)[NSURL URLWithString:urlString], NULL);
    if (imgSrc!=nil) {
        NSDictionary * metaDataDict =  (__bridge NSDictionary *)(CGImageSourceCopyPropertiesAtIndex(imgSrc, 0, nil));
        // Release imgSrc
        CFRelease(imgSrc);
        NSLog(@"Image header %@", metaDataDict);
        return metaDataDict;
    }
    return nil;
}

+ (UIImage *)ll_svgImageName:(NSString *)name size:(CGSize)size
{
    SVGKImage * image = [SVGKImage imageNamed:name];
    image.size        = size;
    return image.UIImage;
}

+ (UIImage *)ll_svgImageName:(NSString *)name size:(CGSize)size ClassName:(NSString *)className
{
    NSString * bundlePath = [[NSBundle bundleForClass:NSClassFromString(className)]
                             .resourcePath stringByAppendingPathComponent:@"/LLCategory.bundle"];
    NSBundle * resource_bundle = [NSBundle bundleWithPath:bundlePath];
    SVGKImage * image          = [SVGKImage imageNamed:name inBundle:resource_bundle];
    image.size                 = size;
    return image.UIImage;
}

// 获取视频第一帧
+ (UIImage *)ll_getVideoPreViewImage:(NSURL *)path
{
    AVURLAsset * asset                      = [[AVURLAsset alloc] initWithURL:path options:nil];
    AVAssetImageGenerator * assetGen        = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    assetGen.appliesPreferredTrackTransform = YES;
    CMTime time                             = CMTimeMakeWithSeconds(0.0, 600);
    NSError * error                         = nil;
    CMTime actualTime;
    CGImageRef image     = [assetGen copyCGImageAtTime:time actualTime:&actualTime error:&error];
    UIImage * videoImage = [[UIImage alloc] initWithCGImage:image];
    CGImageRelease(image);
    return videoImage;
}

+ (UIImage *)ll_imageWithColor:(UIColor *)color size:(CGSize)size rate:(CGFloat)rate
{
    CGFloat imageW = size.width;
    CGFloat imageH = size.height;
    // 1.开启基于位图的图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(imageW, imageH), NO, 0.0);

    if (rate != 0) {
        UIBezierPath * path =
        [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, imageW, imageH)
                                   cornerRadius:rate];
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextAddPath(ctx, path.CGPath);
        CGContextClip(ctx);
    }

    // 2.画一个color颜色的矩形框
    [color set];
    UIRectFill(CGRectMake(0, 0, imageW, imageH));

    // 3.拿到图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();

    // 4.关闭上下文
    UIGraphicsEndImageContext();

    return image;
}

/// 返回一张可以拉伸的图片
+ (UIImage *)ll_resizeImageNamed:(NSString *)name
{
    UIImage * normal = [UIImage imageNamed:name];
    CGFloat width    = normal.size.width * 0.5;
    CGFloat height   = normal.size.height * 0.5;
    normal           = [normal resizableImageWithCapInsets:UIEdgeInsetsMake(height, width, height, width)
                                    resizingMode:UIImageResizingModeTile];
    return normal;
}

+ (UIImage *)ll_createViewImage:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
