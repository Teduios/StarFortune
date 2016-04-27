//
//  CJFortune.h
//  星座
//
//  Created by tarena030 on 16/3/25.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJFortune : NSObject


@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *datetime;
@property(nonatomic,copy)NSString *all;
@property(nonatomic,copy)NSString *color;
@property(nonatomic,copy)NSString *health;
@property(nonatomic,copy)NSString *love;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *lucklyNumber;
@property(nonatomic,copy)NSString *qFriend;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *work;

+(instancetype)paresFortuneJSON:(NSDictionary *)dic;


@end
