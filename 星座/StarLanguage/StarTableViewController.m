//
//  StarTableViewController.m
//  星座
//
//  Created by tarena030 on 16/3/17.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "StarTableViewController.h"

#import "SrarLanguageTableViewCell.h"

#import "AdStarViewController.h"

#import "WBPopMenuModel.h"
#import "WBPopMenuSingleton.h"
#import "WBPopMenuView.h"

#import "CJAnalysisStarViewController.h"
#import "CJNetworkManager.h"
#import "CJDataManager.h"
#import "CJStorWritingModel.h"
#import "CJShowImageAndTextViewController.h"
#import "LBProgressHUD.h"
#import "CJCharacter.h"
#import "Masonry.h"
#import <UIImageView+WebCache.h>
#import "MJRefresh.h"
#import "MJRefreshComponent.h"
#import "MBProgressHUD.h"

@interface StarTableViewController ()

@property(nonatomic,strong)NSArray *allStarContents;

@property(nonatomic,strong)NSArray *starHeadImages;

@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)NSArray *storAllArray;

@property(nonatomic,strong)NSArray *characterArray;

@property(nonatomic,assign)CGFloat changedBigW;
@property(nonatomic,assign)CGFloat changedBigH;
@property(nonatomic,strong)UIImageView *imageView;

@property(nonatomic,strong)UIImageView *showImageView;
@property(nonatomic,strong)NSString *showText;
@property (weak, nonatomic) IBOutlet UIButton *twleveBtn;
@end

@implementation StarTableViewController


-(NSArray *)characterArray
{
    if(!_characterArray)
    {
        _characterArray = [CJCharacter allCharacert];
    }
    return _characterArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:231/255.0 green:58/255.0 blue:123/255.0 alpha:1.0]];
 
    //表头scrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height);
    self.scrollView.pagingEnabled = YES;
    
    AdStarViewController *viewController = [[AdStarViewController alloc]init];
    [self addChildViewController:viewController];
    [self.scrollView addSubview:viewController.view];
//    [self.headerView addSubview:self.scrollView];
    
    [self sendRequest];
    
    [LBProgressHUD showHUDto:self.view animated:YES];
    
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.twleveBtn.layer.cornerRadius = 10;
    self.twleveBtn.layer.masksToBounds = YES;
//    [self foundRefreshControl];
    [self refreshload];
//    [self.refreshControl beginRefreshing];
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(endRefresh) userInfo:nil repeats:YES];
    
//    [self.tableView registerClass:[SrarLanguageTableViewCell class] forCellReuseIdentifier:@"starLanguage"];
    
}

//-(void)endRefresh
//{
//    [self.refreshControl endRefreshing];
//}

-(void)refreshload
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        __weak typeof (self)weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.tableView.mj_header endRefreshing];
            [self endRefreshingClick];
        });
    }];
}

-(void)endRefreshingClick
{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.mode =  MBProgressHUDModeText;
    hud.labelText = @"已最新";
    [hud hide:YES afterDelay:1.5];

}


-(void)sendRequest
{
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    
        NSString *urlStr = @"http://qianming.sinaapp.com/index.php/AndroidApi10/index/cid/qutu/lastId/0";

        [CJNetworkManager sendRequestWithUrl:urlStr parametes:nil sucess:^(id responseObject) {
            
            [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
            
            self.storAllArray = [CJDataManager getAllStorWritingData:responseObject];
           
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.tableView reloadData];
            });
//            [self.tableView reloadData];
            NSLog(@"123");
            
        } failur:^(NSError *error) {
            
            NSLog(@"%@连接端口失败",error);
            
        }];

    });
    
}




#pragma mark - 下拉刷新
//-(void)foundRefreshControl
//{
//    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
//    self.refreshControl = refresh;
//    [refresh addTarget:self action:@selector(refreshCon:) forControlEvents:UIControlEventValueChanged];
//}
//
//-(void)refreshCon:(UIRefreshControl *)sender
//{
//    if(sender.isRefreshing)
//    {
//        [self performSelector:@selector(refreshOver:) withObject:nil afterDelay:3];
//    }
//}
//-(void)refreshOver:(NSString*)result
//{
//    [self sendRequest];
//    [self.refreshControl endRefreshing];
//}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.storAllArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SrarLanguageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"starLanguage" forIndexPath:indexPath];

    cell.storWrit = self.storAllArray[indexPath.row];
//    NSLog(@"%@",cell.storWrit);
//    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"stu.data"];
//    [NSKeyedArchiver archiveRootObject:cell.storWrit toFile:filePath];
    [[NSUserDefaults standardUserDefaults] setObject:cell.storWrit.title forKey:@"text"];
    

    return cell;
}


#pragma mark -- tap点击事件
//-(void)changeBig
//{
//    [self performSegueWithIdentifier:@"goShow" sender:nil];
//}

#pragma mark -- 选中某行跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.hidesBottomBarWhenPushed=YES;
//    [self performSegueWithIdentifier:@"show" sender:indexPath];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        CJShowImageAndTextViewController *show = [self.storyboard instantiateViewControllerWithIdentifier:@"show"];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:show];
        SrarLanguageTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        show.textLabel = cell.storWrit.title;
        show.showImageView = [[UIImageView alloc]init];
        show.showImageView.image = cell.starImageView.image;
        show.showImageView.frame = cell.starImageView.frame;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:nav animated:YES completion:nil];
        });
    });
    
    self.hidesBottomBarWhenPushed=NO;
}

#pragma mark -- 跳转自动调用
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)sender
{
//    UIViewController *vc = segue.destinationViewController;
//    SrarLanguageTableViewCell *cell = [self.tableView cellForRowAtIndexPath:sender];
//    if([vc isKindOfClass:[CJShowImageAndTextViewController class]])
//    {
//        CJShowImageAndTextViewController *show = (CJShowImageAndTextViewController*)vc;
//        show.textLabel = cell.storWrit.title;
//        show.showImageView = [[UIImageView alloc]init];
//        show.showImageView.image = cell.starImageView.image;
//        show.showImageView.frame = cell.starImageView.frame;
//    }
}


- (IBAction)twelveList:(UIButton *)sender {
    
    NSMutableArray *obj = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 12; i++) {
        
        WBPopMenuModel * info = [WBPopMenuModel new];
//      info.image = [self images][i];
        info.title = [self titles][i];
        
        [obj addObject:info];
    }
    
    
     [[WBPopMenuSingleton shareManager] showPopMenuSelecteWithFrame:150 item:obj action:^(NSInteger index) {
     
         CJAnalysisStarViewController *analy = [self.storyboard instantiateViewControllerWithIdentifier:@"analy"];
         analy.titleName = self.titles[index];
         
         analy.content = [self.characterArray[index] characterContent];
         UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:analy];
         [self presentViewController:navi animated:YES completion:nil];

     }];
}

-(NSArray*)titles
{
    return @[@"水瓶座",@"双鱼座",@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座"];
}

//-(NSArray*)images
//{
//    return @[@"twevleList1.png",@"twevleList2.png",@"twevleList3.png",@"twevleList4.png",@"twevleList5.png",@"twevleList6.png",@"twevleList7.png",@"twevleList8.png",@"twevleList9.png",@"twevleList10.png",@"twevleList11.png",@"twevleList12.png"];
//}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
