//
//  SolarListViewController.m
//  星座
//
//  Created by tarena030 on 16/3/10.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "SolarListViewController.h"

#import "FortuneViewController.h"
@interface SolarListViewController ()



//背景名称
@property(nonatomic,strong)NSString *backGround;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *twelveButton;

@property(nonatomic,strong)NSArray *twelveNameArray;

@end

@implementation SolarListViewController

-(NSArray *)twelveNameArray
{
    if(!_twelveNameArray)
    {
        _twelveNameArray = @[@"水瓶座",@"双鱼座",@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座"];
    }
    return _twelveNameArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:231/255.0 green:58/255.0 blue:123/255.0 alpha:1.0]];
    
    
    [self.tabBarController.tabBar setBarTintColor:[UIColor colorWithRed:231/255.0 green:58/255.0 blue:123/255.0 alpha:1.0]];
    
    
    for (UIButton *but in self.twelveButton) {
        but.layer.cornerRadius = 35;
        but.layer.masksToBounds = YES;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
#pragma mark -- 水瓶
- (IBAction)waterBottle:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
    
}
#pragma mark -- 双鱼
- (IBAction)pisces:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 白羊
- (IBAction)whiteSheep:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 金牛
- (IBAction)taurus:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 双子
- (IBAction)twoBrothers:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 巨蟹
- (IBAction)kingCrab:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 狮子
- (IBAction)lion:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 处女
- (IBAction)virginity:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 天秤
- (IBAction)libra:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 天蝎
- (IBAction)scorpion:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 射手
- (IBAction)shooter:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}
#pragma mark -- 摩羯
- (IBAction)capricorn:(UIButton *)sender {
    self.hidesBottomBarWhenPushed=YES;
    [self performSegueWithIdentifier:@"goFortune" sender:sender];
    self.hidesBottomBarWhenPushed=NO;
}

#pragma mark -- 自动跳转调用
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender
{
  
    UIViewController *view = segue.destinationViewController;
   
    FortuneViewController *fort = (FortuneViewController *)view;
   if([view isKindOfClass:[FortuneViewController class]])
   {

       switch (sender.tag) {
           case 1:
               
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];

               break;
           case 2:
              
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
              
               break;
           case 3:
              
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               
               break;
           case 4:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 5:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 6:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 7:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 8:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 9:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 10:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           case 11:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
           default:
               
               fort.twelveName = self.twelveNameArray[sender.tag -1];
               break;
   }
    
    
    }
}



@end
