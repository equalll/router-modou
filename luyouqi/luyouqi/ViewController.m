//
//  ViewController.m
//  luyouqi
//
//  Created by xiong on 15/11/5.
//  Copyright © 2015年 xiong. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"password":@"200888"};
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc] init];
    /**
     *  requestSerializer--申明请求的数据类型是json
     *  ResponseSerializer----申明返回的数据类型是json
     *   manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];//如果报接受类型不一致请替换一致text/html或别的(text/plan)
     */
    manger.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manger POST:@"http://192.168.18.1/api/auth/login" parameters:dic success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error-%@",error);
    }];

}
- (IBAction)back:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
