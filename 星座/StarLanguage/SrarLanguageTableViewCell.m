//
//  SrarLanguageTableViewCell.m
//  星座
//
//  Created by tarena030 on 16/3/18.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "SrarLanguageTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "CJShowImageAndTextViewController.h"
@interface SrarLanguageTableViewCell()

@end

@implementation SrarLanguageTableViewCell


-(void)setStorWrit:(CJStorWritingModel *)storWrit
{
    
    if(_storWrit != storWrit)
    {
        _storWrit = storWrit;
    }
    
    self.backView.layer.cornerRadius = 10;

    [self.starImageView sd_setImageWithURL:[NSURL URLWithString:storWrit.pic] placeholderImage:[UIImage imageNamed:@"load"]];
    self.starTextLabel.text = storWrit.title;
    self.dateLabel.text = storWrit.timeStr;
    
    
//    NSURL *url = [NSURL URLWithString:storWrit.pic];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    self.starImageView.image = [UIImage imageWithData:data];
}


@end
