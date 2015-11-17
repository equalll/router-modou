//
//  moreViewController.m
//  luyouqi
//
//  Created by xiong on 15/11/10.
//  Copyright © 2015年 xiong. All rights reserved.
//

#import "moreViewController.h"
#import "appInfo.h"
#import "afnGETPOST.h"
@interface moreViewController ()

@end

@implementation moreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.test.display_name;
//    NSLog(@"%@",self.test.package_id);
//    获取某插件的最新信息
//    GET /api/plugin/plugin_latest_info?id=0000001
    
    NSString *api = [NSString stringWithFormat:@"http://192.168.18.1/api/plugin/config/get?id=%@&type=MOBILE" ,self.test.package_id];
    [afnGETPOST GETURL:api prames:nil Reques:Requesjson Response:Responsejson success:^(id json) {
        NSLog(@"%@",json);
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
