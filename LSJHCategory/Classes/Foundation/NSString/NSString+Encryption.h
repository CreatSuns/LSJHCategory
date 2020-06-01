//
//  NSString+Encryption.h
//
//  Created by 李世航 on 2019/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encryption)

@end

@interface NSString (MD5)
- (NSString *)ll_md5WithString; // MD5加密
- (NSString *)ll_to16MD5;
@end

@interface NSString (SHA)
- (NSString *)ll_sha1;
- (NSString *)ll_sha256;
- (NSString *)ll_sha512;
@end

NS_ASSUME_NONNULL_END
