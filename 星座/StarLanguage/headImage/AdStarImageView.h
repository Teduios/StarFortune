//
//  AdStarImageView.h
//  星座
//
//  Created by tarena030 on 16/3/19.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TAP_IMAGE_BLOCK)();

@interface AdStarImageView : UIImageView

@property(nonatomic,copy)TAP_IMAGE_BLOCK tapImage_block;

//添加监听
-(void)addTapListenter:(TAP_IMAGE_BLOCK)tapImage;

@end
