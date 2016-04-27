//
//  CJPair.m
//  星座
//
//  Created by tarena030 on 16/3/31.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJPair.h"

@implementation CJPair

+(instancetype)paresPairJSON:(NSDictionary *)dic
{
    CJPair *pair = [[self alloc]init];
    pair.xingzuo1 = dic[@"xingzuo1"];
    pair.xingzuo2 = dic[@"xingzuo2"];
    pair.title = dic[@"title"];
    pair.content1 = dic[@"content1"];
    pair.content2 = dic[@"content2"];
    return pair;
}



@end




