//
//  EverymoodViewController.m
//  星座
//
//  Created by tarena030 on 16/3/12.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "EverymoodViewController.h"


#import "JokeTableViewController.h"

@interface EverymoodViewController ()

//心情语录view
@property (weak, nonatomic) IBOutlet UIView *first;

//星座匹配view
@property (weak, nonatomic) IBOutlet UIView *second;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented;

@end

@implementation EverymoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.first.hidden = false;
    self.second.hidden = true;
    
    self.segmented.layer.cornerRadius = 10;
    self.segmented.layer.masksToBounds = YES;
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:231/255.0 green:58/255.0 blue:123/255.0 alpha:1.0]];
    
}

#pragma mark -- 设置心情语录view和每日一笑view之间的跳转
- (IBAction)changed:(UISegmentedControl *)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.first.hidden = false;
            self.second.hidden = true;
            break;
            case 1:
            self.first.hidden = true;
            self.second.hidden = false;
            
        default:
            break;
    }
    
    
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
