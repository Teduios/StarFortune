//
//  EverydayJoke.h
//  星座
//
//  Created by tarena030 on 16/3/14.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EverydayJoke : NSObject


@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *updatetime;

+(instancetype)paresJokeWithJSON:(NSDictionary *)dic;

@end
