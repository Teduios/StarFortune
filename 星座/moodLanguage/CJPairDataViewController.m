//
//  CJPairDataViewController.m
//  星座
//
//  Created by tarena030 on 16/3/31.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJPairDataViewController.h"
#import "CJNetworkManager.h"
#import "CJDataManager.h"
#import "CJPair.h"
#import "LBProgressHUD.h"
@interface CJPairDataViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleText;
@property (weak, nonatomic) IBOutlet UILabel *content1;

@property (weak, nonatomic) IBOutlet UITextView *content2;


@property(nonatomic,strong)NSArray *pairArray;

@property(nonatomic,strong)CJPair *pair;
@end

@implementation CJPairDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [LBProgressHUD showHUDto:self.view animated:YES];
    
     self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245/255.0 green:155/255.0 blue:184/255.0 alpha:1.0];
    
    [self sendRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendRequest
{
    NSString *urlStr = @"http://api.avatardata.cn/XingZuoPeiDui/Lookup";
    
    NSDictionary *dic = @{@"xingzuo1":self.mainPair,
                          @"xingzuo2":self.deputyPair,
                          @"key":@"56f874de1b3046dd99fdc41202a37d9a"};
    
    [CJNetworkManager sendRequestWithUrl:urlStr parametes:dic sucess:^(id responseObject) {
        
        [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
        self.pair = [CJDataManager getAllPairData:responseObject];
        
        self.titleText.text = self.pair.title;
        self.content1.text = self.pair.content1;
        self.content2.text = self.pair.content2;
        
        
    } failur:^(NSError *error) {
        
        NSLog(@"%@失败",error);
        
    }];
    
}

- (IBAction)backButton:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


@end
