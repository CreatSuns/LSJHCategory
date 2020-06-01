//
//  NSString+FilePath.m
//
//  Created by 李俊恒 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "NSString+FilePath.h"
#import "NSArray+Safe.h"
#import <AVFoundation/AVFoundation.h>

@implementation NSString (FilePath)

+ (NSString *)ll_homePath
{
    return NSHomeDirectory();
}

+ (NSString *)ll_appPath
{
    NSArray * paths =
    NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths ll_safeObjectAtIndex:0];
}

+ (NSString *)ll_docPath
{
    NSArray * paths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths ll_safeObjectAtIndex:0];
}

+ (NSString *)ll_libPrefPath
{
    NSArray * paths =
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths ll_safeObjectAtIndex:0] stringByAppendingFormat:@"/Preferences"];
}

+ (NSString *)ll_libCachePath
{
    NSArray * paths =
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths ll_safeObjectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)ll_tmpPath
{
    return [NSHomeDirectory() stringByAppendingFormat:@"/tmp"];
}

+ (BOOL)ll_IsDirectory:(NSString *)filePath
{
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    return isDirectory;
}

+ (NSInteger)getLocalVideoSizeWithPath:(NSString *)videoPath{
    AVURLAsset * asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:videoPath]];
    CMTime   time = [asset duration];
    int seconds = ceil(time.value/time.timescale);
    NSInteger   fileSize = [[NSFileManager defaultManager] attributesOfItemAtPath:videoPath error:nil].fileSize;
    return fileSize;
}

+ (int)getLocalVideoTimeWithPath:(NSString *)videoPath{
    AVURLAsset * asset = [AVURLAsset assetWithURL:[NSURL fileURLWithPath:videoPath]];
    CMTime   time = [asset duration];
    int seconds = ceil(time.value/time.timescale);
    return seconds;
}
@end
