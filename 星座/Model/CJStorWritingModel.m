//
//  CJStorWritingModel.m
//  星座
//
//  Created by tarena030 on 16/4/1.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJStorWritingModel.h"

@implementation CJStorWritingModel


+(instancetype)paresStorWritingJSON:(NSDictionary *)dic
{
    CJStorWritingModel *storW = [[self alloc]init];
    storW.Id = dic[@"id"];
    storW.title = dic[@"title"];
    storW.pic = dic[@"pic"];
    storW.cTime = dic[@"cTime"];
    storW.picW = dic[@"pic_w"];
    storW.picH = dic[@"pic_h"];
    storW.timeStr = dic[@"timeStr"];
    return storW;
}



@end
