//
//  NSAttributedString+Category.h
//
//  Created by 李俊恒 on 2018/7/4.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (Category)

/**
 Get the AttributedString height

 @param width AttributedString Width
 @return AttributedString height
 */
- (CGFloat)ll_heightWithContainWidth:(CGFloat)width;
@end
