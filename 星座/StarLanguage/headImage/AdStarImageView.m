//
//  AdStarImageView.m
//  星座
//
//  Created by tarena030 on 16/3/19.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "AdStarImageView.h"

@implementation AdStarImageView


-(void)addTapListenter:(TAP_IMAGE_BLOCK)tapImage
{
    self.tapImage_block = tapImage;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureRecognizer:)];
    
    [self addGestureRecognizer:tap];
}

//点中图片block传值
#pragma mark -- 点中图片block传值
-(void)tapGestureRecognizer:(UITapGestureRecognizer*)sender
{
    self.tapImage_block(self);
}


@end
