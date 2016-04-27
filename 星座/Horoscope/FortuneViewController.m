//
//  FortuneViewController.m
//  星座
//
//  Created by tarena030 on 16/3/10.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "FortuneViewController.h"

#import "CJDataManager.h"
#import "CJNetworkManager.h"
#import "CJFortune.h"
#import "LBProgressHUD.h"
@interface FortuneViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *datetime;

@property (weak, nonatomic) IBOutlet UILabel *all;

@property (weak, nonatomic) IBOutlet UILabel *love;
@property (weak, nonatomic) IBOutlet UILabel *health;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *work;
@property (weak, nonatomic) IBOutlet UILabel *luckyNumber;
@property (weak, nonatomic) IBOutlet UILabel *color;
@property (weak, nonatomic) IBOutlet UILabel *qFriend;
@property (weak, nonatomic) IBOutlet UILabel *summary;



//用来接受储存数据的对象
@property(nonatomic,strong)CJFortune *fort;
@end

@implementation FortuneViewController




- (void)viewDidLoad {
    [super viewDidLoad];
//    self.imageView.image = [UIImage imageNamed:self.imageName];
    [LBProgressHUD showHUDto:self.view animated:YES];
    [self sendRequest];
}

//获取数据
-(void)sendRequest
{
    NSString *strUrl = @"http://web.juhe.cn:8080/constellation/getAll";
    
    NSDictionary *params = @{@"consName":self.twelveName,
                             @"type":@"today",
                             @"key":@"d303684534e820f63eee0000efffa95c"};
    
    [CJNetworkManager sendRequestWithUrl:strUrl parametes:params sucess:^(id responseObject) {
        [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
       self.fort = [CJDataManager getAllFortuneData:responseObject];
        
        self.name.text = self.fort.name;
        self.datetime.text = self.fort.datetime;
        self.qFriend.text = self.fort.qFriend ;
        self.all.text = self.fort.all;
        self.love.text = self.fort.love;
        self.health.text = self.fort.health;
        self.money.text = self.fort.money;
        self.work.text = self.fort.work;
        self.color.text = self.fort.color;
        self.luckyNumber.text = [NSString stringWithFormat:@"%@",self.fort.lucklyNumber];
        self.summary.text = self.fort.summary;

    } failur:^(NSError *error) {
        NSLog(@"%@失败",error);
    }];

}





@end
