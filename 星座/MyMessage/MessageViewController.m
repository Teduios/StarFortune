//
//  MessageViewController.m
//  星座
//
//  Created by tarena030 on 16/4/8.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "MessageViewController.h"
#import "MHDatePicker.h"
#import "CJFlowerKinds.h"
#import <QuartzCore/QuartzCore.h>

#import "CJMessage.h"
@interface MessageViewController ()<UIImagePickerControllerDelegate,MHDatePickerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *starName;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *flowerKind;
@property (weak, nonatomic) IBOutlet UILabel *flowerLanguage;

@property (weak, nonatomic) IBOutlet UIVisualEffectView *visualView;
- (IBAction)changedDate:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *setDate;

@property (strong, nonatomic) MHDatePicker *selectDatePicker;
@property(nonatomic,assign)NSInteger sumInteger;
@property(nonatomic,strong)NSArray *flowersArray;
@property(nonatomic,strong)NSArray *backgroundImageViewArray;

@property(nonatomic,assign)BOOL isDismiss;

@end

@implementation MessageViewController

#pragma mark -- LazyLoad
-(NSArray *)flowersArray
{
    if(!_flowersArray)
    {
        _flowersArray = [CJFlowerKinds flowersKindAndLanguage];
    }
    return _flowersArray;
}



-(void)dateChangeConstellation
{
  
    if(self.sumInteger >= 120&&self.sumInteger<=218)
    {
        self.starName.text = @"水瓶座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[0]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[0]flowerLanguage];
        
    }
    else if (self.sumInteger>=219&&self.sumInteger<=320)
    {
        self.starName.text = @"双鱼座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[1]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[1]flowerLanguage];
    }
    else if (self.sumInteger>=321&&self.sumInteger<=419)
    {
        self.starName.text= @"白羊座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[2]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[2]flowerLanguage];
    }
    else if (self.sumInteger>=420&&self.sumInteger<=520)
    {
        self.starName.text = @"金牛座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[3]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[3]flowerLanguage];
    }
    else if (self.sumInteger>=521&&self.sumInteger<=621)
    {
        self.starName.text = @"双子座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[4]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[4]flowerLanguage];
    }
    else if (self.sumInteger>=622&&self.sumInteger<=722)
    {
        self.starName.text = @"巨蟹座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[5]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[5]flowerLanguage];
    }
    else if (self.sumInteger>=723&&self.sumInteger<=822)
    {
        self.starName.text = @"狮子座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[6]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[6]flowerLanguage];
    }
    else if (self.sumInteger>=823&&self.sumInteger<=922)
    {
        self.starName.text = @"处女座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[7]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[7]flowerLanguage];
    }
    else if (self.sumInteger>=923&&self.sumInteger<=1023)
    {
        self.starName.text = @"天秤座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[8]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[8]flowerLanguage];
    }
    else if (self.sumInteger>=1024&&self.sumInteger<=1122)
    {
        self.starName.text = @"天蝎座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[9]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[9]flowerLanguage];
    }
    else if (self.sumInteger>=1123&&self.sumInteger<=1221)
    {
        self.starName.text = @"射手座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[10]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[10]flowerLanguage];
    }
    else if ((self.sumInteger>=1222&&self.sumInteger<=1231)||(self.sumInteger>=101&&self.sumInteger<=119))
    {
        self.starName.text = @"摩羯座";
        [CJMessage aphlyWithText:self.starName];
        [CJMessage aphlyWithText:self.flowerKind];
        [CJMessage aphlyWithText:self.flowerLanguage];
        self.flowerKind.text = [self.flowersArray[11]flowersKind];
        self.flowerLanguage.text = [self.flowersArray[11]flowerLanguage];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:self.flowerKind.text forKey:@"flowerKind"];
    [[NSUserDefaults standardUserDefaults] setObject:self.flowerLanguage.text forKey:@"flowerLanguage"];
    [[NSUserDefaults standardUserDefaults] setObject:self.starName.text forKey:@"starName"];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:231/255.0 green:58/255.0 blue:123/255.0 alpha:10/255.0]];
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleDefault];
    
    [self animationEmitterLayer];
    [self dismissVisult];
    
    
}

#pragma mark - 动画
-(void)animationEmitterLayer
{
    
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(100, -30);
    emitterLayer.emitterSize = CGSizeMake(self.view.bounds.size.width*2, 0);
    emitterLayer.emitterMode = kCAEmitterLayerOutline;
    emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    CAEmitterCell *emittercell = [CAEmitterCell emitterCell];
    
   
    
    emittercell.contents = (__bridge id)[UIImage imageNamed:@"sakura1"].CGImage;
    
    
    //缩放比例
    emittercell.scale = 0.02;
    emittercell.scaleRange = 0.5;
   
    
    //每秒产生的数量
    emittercell.birthRate = 7;
    emittercell.lifetime = 80;
   
    //每秒变透明的速度
    emittercell.alphaSpeed = -0.01;
  
    //秒速
    emittercell.velocity = 40;
    emittercell.velocityRange = 60;
  
    //掉落的角度范围
    emittercell.emissionRange = M_PI;
    
    
    //旋转的速度
    emittercell.spin = M_PI_4;
    
    //阴影的不透明度
    emitterLayer.shadowOpacity = 1;
   
    //阴影化开的程度
    emitterLayer.shadowRadius = 8;
    //阴影的偏移量
    emitterLayer.shadowOffset = CGSizeMake(3, 3);
    //阴影的颜色
    emitterLayer.shadowColor = [[UIColor whiteColor]CGColor];
    
    emitterLayer.emitterCells = [NSArray arrayWithObject:emittercell];
    [self.backgroundImageView.layer addSublayer:emitterLayer];
    
}
#pragma mark - 方法
- (IBAction)changedDate:(id)sender {
    
    _selectDatePicker = [[MHDatePicker alloc] init];
    _selectDatePicker.isBeforeTime = YES;
    _selectDatePicker.datePickerMode = UIDatePickerModeDate;
    _selectDatePicker.delegate = self;

    __weak typeof(self) weakSelf = self;
    [_selectDatePicker didFinishSelectedDate:^(NSDate *selectedDate) {
        
        weakSelf.dateLabel.text = [weakSelf dateStringWithDate:selectedDate DateFormat:@"yyyy年MM月dd日"];
        
        [CJMessage aphlyWithText:self.dateLabel];
        
        [[NSUserDefaults standardUserDefaults] setObject:weakSelf.dateLabel.text forKey:@"dateLabel"];
        
        NSRange monthR = {5,2};
        NSString *month = [weakSelf.dateLabel.text substringWithRange:monthR];
        //        self.monthInterger = [month integerValue];
        
        NSRange dayR = {8,2};
        NSString *day = [weakSelf.dateLabel.text substringWithRange:dayR];
        //        self.dayInteger = [day integerValue];
        
        NSString *sumStr = [month stringByAppendingString:day];
        self.sumInteger = [sumStr integerValue];
        
        [self dateChangeConstellation];
        
    }];
    
    
}

- (NSString *)dateStringWithDate:(NSDate *)date DateFormat:(NSString *)dateFormat
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    NSString *str = [dateFormatter stringFromDate:date];
    return str ? str : @"";
    
}

-(void)dismissVisultView
{
    self.visualView.hidden = YES;
    self.isDismiss = 1;
    [[NSUserDefaults standardUserDefaults] setBool:self.isDismiss forKey:@"isDismiss"];

}

-(void)dismissVisult
{
    BOOL isdismiss = [[NSUserDefaults standardUserDefaults] boolForKey:@"isDismiss"];;
    if(isdismiss)
    {
        self.visualView.hidden = YES;
        self.setDate.alpha = 0;
    }
   
    self.flowerKind.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"flowerKind"];
    self.dateLabel.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"dateLabel"];
    self.flowerLanguage.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"flowerLanguage"];
    self.starName.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"starName"];
}



@end
