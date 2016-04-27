//
//  CJFlowerKinds.h
//  星座
//
//  Created by tarena030 on 16/4/8.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJFlowerKinds : NSObject

@property(nonatomic,strong)NSString *flowersKind;
@property(nonatomic,strong)NSString *flowerLanguage;

+(NSArray*)flowersKindAndLanguage;


@end
