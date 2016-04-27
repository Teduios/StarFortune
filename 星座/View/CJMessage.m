//
//  CJMessage.m
//  星座
//
//  Created by tarena030 on 16/4/8.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJMessage.h"

@implementation CJMessage

+(void)aphlyWithText:(UILabel *)flowersLabel
{
    flowersLabel.alpha = 0;
    [UIView animateWithDuration:2 animations:^{
       
        flowersLabel.alpha = 1;
        
    }];
}

@end
