//
//  CJShowImageAndTextViewController.m
//  星座
//
//  Created by tarena030 on 16/4/11.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "CJShowImageAndTextViewController.h"
#import "StarTableViewController.h"
#import "Masonry.h"
@interface CJShowImageAndTextViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;
@property (weak, nonatomic) IBOutlet UILabel *showText;

@end

@implementation CJShowImageAndTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showText.text = self.textLabel;
    self.showImage.image = self.showImageView.image;
    
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
