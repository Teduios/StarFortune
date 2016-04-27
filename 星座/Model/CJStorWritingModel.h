//
//  CJStorWritingModel.h
//  星座
//
//  Created by tarena030 on 16/4/1.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJStorWritingModel : NSObject


//id -> Id
@property (nonatomic, copy) NSString *Id;

@property (nonatomic, copy) NSString *downUrl;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *cTime;
//pic_w ->picW
@property (nonatomic, copy) NSString *picW;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *uname;
//pic_h ->picH
@property (nonatomic, copy) NSString *picH;

@property (nonatomic, copy) NSString *timeStr;
//pic_t -> picT
@property (nonatomic, copy) NSString *picT;
//cate_id -> cateId
@property (nonatomic, copy) NSString *cateId;

+(instancetype)paresStorWritingJSON:(NSDictionary *)dic;

@end
