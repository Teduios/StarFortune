//
//  CJPair.h
//  星座
//
//  Created by tarena030 on 16/3/31.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CJPair : NSObject

@property(nonatomic,copy)NSString *xingzuo1;
@property(nonatomic,copy)NSString *xingzuo2;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content1;
@property(nonatomic,copy)NSString *content2;


+(instancetype)paresPairJSON:(NSDictionary *)dic;


@end

