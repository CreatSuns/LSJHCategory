//
//  UITextView+PlaceHolder.m

#import "UITextView+PlaceHolder.h"
#import <objc/runtime.h>
static const void * ll_placeHolderKey;

@interface UITextView ()
@property (nonatomic, readonly) UILabel * ll_placeHolderLabel;
@end

@implementation UITextView (PlaceHolder)

+ (void)load
{
    [super load];
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"layoutSubviews")),
                                   class_getInstanceMethod(self.class, @selector(llPlaceHolder_swizzling_layoutSubviews)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(llPlaceHolder_swizzled_dealloc)));
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"setText:")),
                                   class_getInstanceMethod(self.class, @selector(llPlaceHolder_swizzled_setText:)));
}

#pragma mark - swizzled
- (void)llPlaceHolder_swizzled_dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self llPlaceHolder_swizzled_dealloc];
}

- (void)llPlaceHolder_swizzling_layoutSubviews
{
    if (self.ll_placeHolder) {
        UIEdgeInsets textContainerInset = self.textContainerInset;
        CGFloat lineFragmentPadding     = self.textContainer.lineFragmentPadding;
        CGFloat x                       = lineFragmentPadding + textContainerInset.left + self.layer.borderWidth;
        CGFloat width                   = CGRectGetWidth(self.bounds) - x - textContainerInset.right - 2 * self.layer.borderWidth;
        CGFloat height                  = [self.ll_placeHolderLabel sizeThatFits:CGSizeMake(width, 0)].height;
        CGFloat y                       = textContainerInset.top + self.layer.borderWidth;
//        CGFloat y                       = (self.frame.size.height - height) / 2;
        self.ll_placeHolderLabel.frame = CGRectMake(x, y, width, height);
    }
    [self llPlaceHolder_swizzling_layoutSubviews];
}

- (void)llPlaceHolder_swizzled_setText:(NSString *)text
{
    [self llPlaceHolder_swizzled_setText:text];
    if (self.ll_placeHolder) {
        [self updatePlaceHolder];
    }
}

#pragma mark - associated
- (NSString *)ll_placeHolder
{
    return objc_getAssociatedObject(self, &ll_placeHolderKey);
}

- (void)setll_placeHolder:(NSString *)ll_placeHolder
{
    objc_setAssociatedObject(self, &ll_placeHolderKey, ll_placeHolder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updatePlaceHolder];
}

- (UIColor *)ll_placeHolderColor
{
    return self.ll_placeHolderLabel.textColor;
}

- (void)setll_placeHolderColor:(UIColor *)ll_placeHolderColor
{
    self.ll_placeHolderLabel.textColor = ll_placeHolderColor;
}

- (NSString *)placeholder
{
    return self.ll_placeHolder;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.ll_placeHolder = placeholder;
}

#pragma mark - update
- (void)updatePlaceHolder
{
    if (self.text.length) {
        [self.ll_placeHolderLabel removeFromSuperview];
        return;
    }
    self.ll_placeHolderLabel.font          = self.font ? self.font : self.cacutDefaultFont;
    self.ll_placeHolderLabel.textAlignment = self.textAlignment;
    self.ll_placeHolderLabel.text          = self.ll_placeHolder;
    [self insertSubview:self.ll_placeHolderLabel atIndex:0];
}

#pragma mark - lazzing
- (UILabel *)ll_placeHolderLabel
{
    UILabel * placeHolderLab = objc_getAssociatedObject(self, @selector(ll_placeHolderLabel));
    if (!placeHolderLab) {
        placeHolderLab               = [[UILabel alloc] init];
        placeHolderLab.numberOfLines = 0;
        placeHolderLab.textColor     = [UIColor lightGrayColor];
        objc_setAssociatedObject(self, @selector(ll_placeHolderLabel), placeHolderLab, OBJC_ASSOCIATION_RETAIN);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePlaceHolder) name:UITextViewTextDidChangeNotification object:self];
    }
    return placeHolderLab;
}

- (UIFont *)cacutDefaultFont
{
    static UIFont * font = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UITextView * textview = [[UITextView alloc] init];
        textview.text         = @" ";
        font                  = textview.font;
    });
    return font;
}
@end
