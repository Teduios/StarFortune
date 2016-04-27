//
//  CJAnalysisStarViewController.m
//  星座
//
//  Created by tarena030 on 16/3/27.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJAnalysisStarViewController.h"
#import "StarTableViewController.h"
@interface CJAnalysisStarViewController ()
@property (weak, nonatomic) IBOutlet UILabel *charatContent;

@end
//245 155 184
@implementation CJAnalysisStarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:245/255.0 green:155/255.0 blue:184/255.0 alpha:1.0];
    self.navigationItem.title = self.titleName;
    self.charatContent.text = self.content;
}
- (IBAction)back:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
