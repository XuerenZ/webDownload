//
//  HMTableViewController.m
//  loadPictureUseWeb01
//
//  Created by mac on 16/8/20.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "HMTableViewController.h"
#import "AFNetworking.h"
#import "HMPictureModel.h"
#import "HMTableViewCell.h"

@interface HMTableViewController ()

@end

@implementation HMTableViewController
{
    NSArray *_arrList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadPicture];
}
//https://raw.githubusercontent.com/XuerenZ/webDownload/master/downLoadPicture01/downLoadPicture01/apps.json
- (void)loadPicture
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *strUrl = @"https://raw.githubusercontent.com/XuerenZ/webDownload/master/downLoadPicture01/downLoadPicture01/apps.json";

    [manager GET:strUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray *  _Nullable responseObject) {
        
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:responseObject.count];
        
        [responseObject enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HMPictureModel *model = [HMPictureModel getModelWithDict:obj];
            [arrM addObject:model];
            
        }];
        _arrList = arrM.copy;
//        需要刷新列表
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error");
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _arrList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    HMPictureModel *model = _arrList[indexPath.row];
    cell.model = model;
    
    
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
