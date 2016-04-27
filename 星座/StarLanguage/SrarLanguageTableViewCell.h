//
//  SrarLanguageTableViewCell.h
//  星座
//
//  Created by tarena030 on 16/3/18.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CJStorWritingModel.h"
@interface SrarLanguageTableViewCell : UITableViewCell

//@property(nonatomic,strong)StarLanguage *starlanguage;

@property(nonatomic,strong)CJStorWritingModel *storWrit;

//图片
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
//文字
@property (weak, nonatomic) IBOutlet UILabel *starTextLabel;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIView *backView;



@end
