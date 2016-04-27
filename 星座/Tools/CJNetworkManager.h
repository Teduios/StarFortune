//
//  CJNetworkManager.h
//  星座
//
//  Created by tarena030 on 16/3/25.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJNetworkManager : NSObject


/**
 *  根据制定的数据，封装了发送请求的过程
 这个实现的请求，可以使用AFN这个第三方，也可以使用系统的NSURLSessionManager
 */
+(void)sendRequestWithUrl:(NSString*)urlStr parametes:(NSDictionary*)params sucess:(void(^)(id responseObject))sucess failur:(void(^)(NSError *error))failur;



@end
