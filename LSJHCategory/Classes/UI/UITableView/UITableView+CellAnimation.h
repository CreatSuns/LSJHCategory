//
//  UITableView+CellAnimation.h
//
//  Created by 李俊恒 on 2018/7/6.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CellAnimation)
- (void)ll_moveAnimation;        //左侧飞入
- (void)ll_alphaAnimation;       //透明
- (void)ll_fallAnimation;        //上面掉落
- (void)ll_shakeAnimation;       //抖动动画
- (void)ll_overTurnAnimation;    //上下翻转动画
- (void)ll_toTopAnimation;       //从下往上
- (void)ll_springListAnimation;  //从上往下弹动动画
- (void)ll_shrinkToTopAnimation; //从下往上挤向顶部
- (void)ll_layDownAnimation;     //从上往下展开
- (void)ll_roteAnimation;        //左右翻转动画
@end
