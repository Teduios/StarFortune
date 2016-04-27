//
//  CJDataManager.h
//  星座
//
//  Created by tarena030 on 16/3/25.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJFortune.h"
#import "CJPair.h"
#import "CJStorWritingModel.h"
@interface CJDataManager : NSObject


+(CJFortune *)getAllFortuneData:(id)responseObject;


/**
 *  解析传入的网络流responseObject对象
 *  此方法只负责解析网络流，不关心网络流是通过什么渠道得来的
 *  @return NSArray<EverydayJoke *>
 */
+(NSArray *)getAllJokeData:(id)responseObject;

+(CJPair *)getAllPairData:(id)responseObject;




//+(void)getStorData:(void (^)(NSArray<CJStorWritingModel *> *, NSError *))completionHandler data:(id)responseObject;
//+(NSArray *)getAllWritData:(id)responseObject;

+(NSArray *)getAllStorWritingData:(id)responseObject;



@end
