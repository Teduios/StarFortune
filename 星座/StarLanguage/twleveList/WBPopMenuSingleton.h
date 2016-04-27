//
//  WBPopMenuSingleton.h
//  QQ_PopMenu_Demo
//
//  Created by tarena030 on 16/3/17.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WBPopMenuSingleton : NSObject

/** 创建单例
 *
 *
 */
+ (WBPopMenuSingleton *) shareManager;


/** 创建一个弹出菜单
 *
 * @param frame 视图尺寸
 * @param titles 文字
 * @param images 图片
 * @param action 回调点击方法
 */
- (void) showPopMenuSelecteWithFrame:(CGFloat)width
                                item:(NSArray *)item
                              action:(void(^)(NSInteger index))action;

/** 隐藏菜单
 *
 *
 */
- (void) hideMenu;
@end
