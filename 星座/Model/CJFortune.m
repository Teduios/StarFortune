//
//  CJFortune.m
//  星座
//
//  Created by tarena030 on 16/3/25.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJFortune.h"

@implementation CJFortune


+(instancetype)paresFortuneJSON:(NSDictionary *)dic
{
    CJFortune *fortune = [[self alloc]init];
    
    fortune.name = dic[@"name"];
    fortune.datetime = dic[@"datetime"];
    fortune.all = dic[@"all"];
    fortune.color = dic[@"color"];
    fortune.health = dic[@"health"];
    fortune.love = dic[@"love"];
    fortune.money = dic[@"money"];
    fortune.lucklyNumber = dic[@"number"];
    fortune.qFriend = dic[@"QFriend"];
    fortune.work = dic[@"work"];
    fortune.summary = dic[@"summary"];
    return fortune;
}




@end
