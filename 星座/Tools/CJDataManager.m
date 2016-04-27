//
//  CJDataManager.m
//  星座
//
//  Created by tarena030 on 16/3/25.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJDataManager.h"
#import "CJFortune.h"
#import "EverydayJoke.h"
#import "CJPair.h"
#import "CJStorWritingModel.h"

@implementation CJDataManager


//返回一个CJFortune对象
+(CJFortune *)getAllFortuneData:(id)responseObject
{

     CJFortune *fort = [CJFortune paresFortuneJSON:responseObject];
    
    return fort;
}


+(NSArray *)getAllJokeData:(id)responseObject
{
    
    NSArray *jokeArray = responseObject[@"result"][@"data"];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in jokeArray) {
        EverydayJoke *everyJoke = [EverydayJoke paresJokeWithJSON:dict];
        [array addObject:everyJoke];
        
    }
    return array;
}

+(CJPair *)getAllPairData:(id)responseObject
{
    
    NSDictionary *pairDict = responseObject[@"result"];
    
    CJPair *pair = [CJPair paresPairJSON:pairDict];
    
    return pair;
}


//+(void)getStorData:(void (^)(NSArray<CJStorWritingModel *> *, NSError *))completionHandler data:(id)responseObject
//{
//    NSArray *storArray = responseObject;
//    NSMutableArray *array = [NSMutableArray array];
//    for (NSDictionary *dic in storArray) {
//        
//    }
//}

//+(NSArray *)getAllWritData:(id)responseObject
//{
//    NSArray *writAll = responseObject;
//    NSMutableArray *array = [NSMutableArray array];
//    for (NSDictionary *dic in writAll) {
//        Writing *wirt = [Writing paresForWritingJSON:dic];
//        [array addObject:wirt];
//    }
//    return array;
//}

+(NSArray *)getAllStorWritingData:(id)responseObject
{
    NSMutableArray *array = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSArray *storWriting = responseObject[@"rows"];
        
        for (NSDictionary *dict in storWriting) {
            CJStorWritingModel *stor = [CJStorWritingModel paresStorWritingJSON:dict];
            [array addObject:stor];
        }

    });
       return array;
}





@end
