//
//  EverydayJoke.m
//  星座
//
//  Created by tarena030 on 16/3/14.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "EverydayJoke.h"

@implementation EverydayJoke

+(instancetype)paresJokeWithJSON:(NSDictionary *)dic
{
    EverydayJoke *joke = [[self alloc]init];
    joke.content = dic[@"content"];
    joke.updatetime = dic[@"updatetime"];
    
    return joke;
}


@end
