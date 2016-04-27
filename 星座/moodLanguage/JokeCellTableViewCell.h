//
//  JokeCellTableViewCell.h
//  星座
//
//  Created by tarena030 on 16/3/12.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EverydayJoke.h"
@interface JokeCellTableViewCell : UITableViewCell


@property(nonatomic,strong)EverydayJoke *everyJoke;

@property(nonatomic,strong)NSArray *everyJokeArray;

@end
