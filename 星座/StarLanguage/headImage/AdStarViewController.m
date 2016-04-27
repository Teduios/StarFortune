//
//  AdStarViewController.m
//  星座
//
//  Created by tarena030 on 16/3/19.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "AdStarViewController.h"
#import "AdStar.h"
@interface AdStarViewController ()<AdStarDelegate>

@end

@implementation AdStarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *array = [NSMutableArray array];
    for(int i = 0;i<5;i++)
    {
        [array addObject:[NSString stringWithFormat:@"star%d.jpg",i+1]];
    }
    
    AdStar *adImageView = [[AdStar alloc]initWithFrame:CGRectMake(0, 0, kWinW, 160) Images:array Title:nil];
    adImageView.delegate = self;
    
    [self.view addSubview:adImageView];
}
#pragma mark -- 实现代理方法
-(void)AdStar:(AdStar *)adview didSeletorAtIndex:(NSInteger)index
{
    NSLog(@"第%ld被点中",index);
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
