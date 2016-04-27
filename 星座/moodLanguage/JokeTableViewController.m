//
//  JokeTableViewController.m
//  星座
//
//  Created by tarena030 on 16/3/12.
//  Copyright © 2016年 tarena030. All rights reserved.
//

#import "JokeTableViewController.h"
#import "EverydayJoke.h"
#import "JokeCellTableViewCell.h"
#import "CJNetworkManager.h"
#import "CJDataManager.h"
#import "MBProgressHUD.h"
@interface JokeTableViewController ()

@property(nonatomic,strong)NSMutableArray *mutArray;

@property(nonatomic,strong)NSArray *jokeArray;
@end


@implementation JokeTableViewController

//-(NSMutableArray *)mutArray
//{
//    if(!_mutArray)
//    {
//        _mutArray = [[EverydayJoke allJoke]mutableCopy];
//    }
//    return _mutArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 70;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //调用获取数据
    [self sendRequest];
    //调用下拉刷新
    [self foundRefreshControl];
}

//获取数据
-(void)sendRequest
{
    NSString *urlStr = @"http://japi.juhe.cn/joke/content/list.from";
    
    NSDictionary *jokeDict = @{@"sort":@"asc",
                               @"time":@"1418816972",
                               @"pagesize":@"20",
                               @"key":@"cb072c49cd38c7cf6df969037ccd2ef0"};
    
    [CJNetworkManager sendRequestWithUrl:urlStr parametes:jokeDict sucess:^(id responseObject) {
        
        self.jokeArray = [CJDataManager getAllJokeData:responseObject];
        
        [self.tableView reloadData];
        
    } failur:^(NSError *error) {
        
        NSLog(@"失败：%@",error);
        
    }];
    
}

#pragma mark -- 创建下拉刷新
-(void)foundRefreshControl
{
    UIRefreshControl *refresh = [[UIRefreshControl alloc]init];
    self.refreshControl = refresh;
    [refresh addTarget:self action:@selector(refreshCon:) forControlEvents:UIControlEventValueChanged];
}

-(void)refreshCon:(UIRefreshControl*)sender
{
    if(sender.isRefreshing)
    {
        [self performSelector:@selector(refreshOver:) withObject:nil afterDelay:3];
    }
}

-(void)refreshOver:(NSString*)result
{
    [self sendRequest];
    [self.refreshControl endRefreshing];
    [self endRefreshingClick];
}

-(void)endRefreshingClick
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.mode =  MBProgressHUDModeText;
    hud.labelText = @"已最新";
    [hud hide:YES afterDelay:1.5];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.jokeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JokeCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JokeCell" forIndexPath:indexPath];
    
    cell.everyJoke = self.jokeArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
    
    return cell;
}


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
