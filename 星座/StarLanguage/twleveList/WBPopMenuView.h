//
//  WBPopMenuView.h
//  QQ_PopMenu_Demo
//
//  Created by tarena030 on 16/3/17.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBPopMenuView : UIView

@property (nonatomic, assign) CGFloat menuWidth;
@property (nonatomic, copy) void(^action)(NSInteger index);
@property (nonatomic, copy) NSArray * menuItem;
@property (nonatomic, strong) UITableView * tableView;


- (instancetype) initWithFrame:(CGRect)frame
                     menuWidth:(CGFloat)menuWidth
                         items:(NSArray *)items
                        action:(void(^)(NSInteger index))action;
@end
