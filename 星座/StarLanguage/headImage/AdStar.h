//
//  AdStar.h
//  星座
//
//  Created by tarena030 on 16/3/19.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AdStar;
@protocol AdStarDelegate <NSObject>

@required
-(void)AdStar:(AdStar*)adview didSeletorAtIndex:(NSInteger)index;

@end



@interface AdStar : UIView


-(id)initWithFrame:(CGRect)frame Images:(NSArray*)images Title:(NSArray*)titles;

@property(nonatomic,weak)id<AdStarDelegate>delegate;


@end
