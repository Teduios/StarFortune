//
//  JokeCellTableViewCell.m
//  星座
//
//  Created by tarena030 on 16/3/12.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "JokeCellTableViewCell.h"


@interface JokeCellTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *jokeLabel;

@property (weak, nonatomic) IBOutlet UILabel *datetime;

@end



@implementation JokeCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark -- 给重写set方法自定义cell赋值
-(void)setEveryJoke:(EverydayJoke *)everyJoke
{
    if(_everyJoke != everyJoke)
    {
        _everyJoke = everyJoke;
    }
    
    self.jokeLabel.text = everyJoke.content;
    self.datetime.text = everyJoke.updatetime;
}



@end
