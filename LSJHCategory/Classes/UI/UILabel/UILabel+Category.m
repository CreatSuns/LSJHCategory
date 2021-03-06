//
//  UILabel+Category.m
//
//  Created by 李世航 on 2018/7/9.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "UILabel+Category.h"

@implementation UILabel (Category)

- (void)ll_alignTop
{
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
    //    控件的高度除以一行文字的高度
    int num = self.frame.size.height / fontSize.height;
    //计算需要添加换行符个数
    int newLinesToPad  = num - self.numberOfLines;
    self.numberOfLines = 0;
    for (int i = 0; i < newLinesToPad; i++) {
        //在文字后面添加换行符"/n"
        self.text = [self.text stringByAppendingString:@"\n"];
    }
}

- (void)ll_alignBottom
{
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
    //控件的高度除以一行文字的高度
    int num = self.frame.size.height / fontSize.height;
    //计算需要添加换行符个数
    int newLinesToPad  = num - self.numberOfLines;
    self.numberOfLines = 0;
    for (int i = 0; i < newLinesToPad; i++) {
        //在文字前面添加换行符"/n"
        self.text = [NSString stringWithFormat:@" \n%@", self.text];
    }
}

- (void)ll_changeLineSpaceForLabelWithSpace:(float)space text:(NSString *)labelText
{
    NSMutableAttributedString * attributedString =
    [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)ll_changeWordSpaceForLabelWithSpace:(float)space
{
    NSString * labelText = self.text;
    NSMutableAttributedString * attributedString =
    [[NSMutableAttributedString alloc] initWithString:labelText
                                           attributes:@{
                                               NSKernAttributeName : @(space)
                                           }];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

- (void)ll_changeSpaceForLabelWithLineSpace:(float)lineSpace WordSpace:(float)wordSpace
{
    NSString * labelText = self.text;
    NSMutableAttributedString * attributedString =
    [[NSMutableAttributedString alloc] initWithString:labelText
                                           attributes:@{
                                               NSKernAttributeName : @(wordSpace)
                                           }];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:paragraphStyle
                             range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
}

+ (CGFloat)ll_getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    UILabel * label     = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text          = title;
    label.font          = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)ll_getWidthWithTitle:(NSString *)title font:(UIFont *)font
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text      = title;
    label.font      = font;
    [label sizeToFit];
    return label.frame.size.width;
}

@end
