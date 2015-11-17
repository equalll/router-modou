//
//  AppTableViewController.m
//  luyouqi
//
//  Created by xiong on 15/11/5.
//  Copyright © 2015年 xiong. All rights reserved.
//

#import "AppTableViewController.h"
#import "afnGETPOST.h"
#import "MJExtension.h"
#import "appInfo.h"
#import "UIImageView+WebCache.h"
#import "moreViewController.h"

@interface AppTableViewController ()
@property (weak, nonatomic) UIImageView *appIcon;
@property (weak, nonatomic) UILabel *appName;
@property (weak, nonatomic) UILabel *appStatMessage;
@property (strong, nonatomic) NSArray *plugins;

@end

@implementation AppTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"插件信息";

//    GET /api/plugin/installed_plugins
    NSString *url = @"http://192.168.18.1/api/plugin/installed_plugins";
    [afnGETPOST GETURL:url prames:nil Reques:Requesjson Response:Responsejson success:^(id json) {
        NSArray *plugins = [appInfo objectArrayWithKeyValuesArray:json[@"plugins"]];
        self.plugins = plugins;
        NSLog(@"%@",json);
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.plugins.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"app" forIndexPath:indexPath];
    /**
     *  icon tag = 200
     *  name tag = 201
     *  stat tag = 202
     *  2s tag = 203
     */
    UILabel *tags     = [cell viewWithTag:203];
    UILabel *stat     = [cell viewWithTag:202];
    UILabel *appname  = [cell viewWithTag:201];
    UIImageView *icon = [cell viewWithTag:200];
    
    appInfo *info = self.plugins[indexPath.row];
    appname.text  = info.display_name;
    [icon sd_setImageWithURL:[NSURL URLWithString:info.icon_url]];
    if (info.isRunning) {
    stat.text   = @"正在运行";
    }else{
    stat.text   = @"未启动";
    }
    tags.hidden = YES;
//    NSLog(@"%@",info.package_id);
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    moreViewController *more = [moreViewController new];
    more.test = self.plugins[indexPath.row];
    [self.navigationController pushViewController:more animated:YES];
}

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
