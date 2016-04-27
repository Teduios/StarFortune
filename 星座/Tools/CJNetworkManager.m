//
//  CJNetworkManager.m
//  星座
//
//  Created by tarena030 on 16/3/25.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJNetworkManager.h"
#import "AFNetworking.h"
#import "AFURLResponseSerialization.h"
#import "AFURLRequestSerialization.h"
@implementation CJNetworkManager


+(void)sendRequestWithUrl:(NSString *)urlStr parametes:(NSDictionary *)params sucess:(void (^)(id))sucess failur:(void (^)(NSError *))failur
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:urlStr parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            sucess(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            failur(error);
            
        }];
        
    });
    
    
    
    
    
    
}


@end
