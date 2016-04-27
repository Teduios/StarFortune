//
//  CJPairViewController.m
//  星座
//
//  Created by tarena030 on 16/3/31.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJPairViewController.h"
#import "CJPicerController.h"
#import "CJPairDataViewController.h"
@interface CJPairViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, LewPickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *mainButton;

@property (weak, nonatomic) IBOutlet UIButton *deputyButton;
@property (weak, nonatomic) IBOutlet UIButton *beginPairButton;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@property(nonatomic,assign)NSInteger number;

@end

@implementation CJPairViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self exit];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

-(void)exit
{
    self.beginPairButton.layer.cornerRadius = 10;
    self.contentLabel.text = @"每个星座的不同性格，聚在一起，必然会产生不同的化学反应。你与他（她）的配对会如何？会是只羡鸳鸯不羡仙，还是欢喜怨家，还是如何的一对组合呢？让第一星座的爱情配对帮助你们分析一下。不可以此做为恋爱的依据哦，那样也许会错失一生的幸福。本星座配对仅供参考。";
}


- (IBAction)mainButton:(UIButton *)sender {
    
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    CJPicerController *pickerController = [[CJPicerController alloc]initWithDelegate:self];
    pickerController.pickerView = pickerView;
    pickerController.titleLabel.text = @"请选择";
    self.number = 1;
    [pickerController showInView:self.view];
}

- (IBAction)deputyButton:(UIButton *)sender {
    
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    CJPicerController *pickerController = [[CJPicerController alloc]initWithDelegate:self];
    pickerController.pickerView = pickerView;
    pickerController.titleLabel.text = @"请选择";
    self.number = 2;
    [pickerController showInView:self.view];
    
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 12;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.titles[row];
}

- (void)lewPickerControllerDidOKButtonPressed:(CJPicerController *)pickerController{
    
}

- (void)lewPickerControllerDidCancelButtonPressed:(CJPicerController *)pickerController{
    NSLog(@"cancel");
}


-(NSArray *)titles
{
    return @[@"水瓶座",@"双鱼座",@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(self.number == 1)
    {
        [self.mainButton setTitle:self.titles[row] forState:UIControlStateNormal];
    }
    else if(self.number == 2)
    {
        [self.deputyButton setTitle:self.titles[row] forState:UIControlStateNormal];
    }
}

- (IBAction)beginPair:(UIButton *)sender {
    
//    [self performSegueWithIdentifier:@"goPairData" sender:sender];
    
    CJPairDataViewController *pairdata = [self.storyboard instantiateViewControllerWithIdentifier:@"pair"];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:pairdata];
    pairdata.mainPair = self.mainButton.titleLabel.text;
    pairdata.deputyPair = self.deputyButton.titleLabel.text;
    
    [self presentViewController:navi animated:YES completion:nil];
    
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    UINavigationController *navi = segue.destinationViewController;
//    if([navi isKindOfClass:[CJPairDataViewController class]])
//    {
//        CJPairDataViewController *paiedata = (CJPairDataViewController*)navi;
//        
//        paiedata.mainPair = self.mainButton.titleLabel.text;
//        paiedata.deputyPair = self.deputyButton.titleLabel.text;
//        
//    }
//}



@end
