//
//  WanViewController.m
//  luyouqi
//
//  Created by xiong on 15/11/5.
//  weakright © 2015年 xiong. All rights reserved.
//

#import "WanViewController.h"
#import <AFNetworking.h>
#import "afnGETPOST.h"
@interface WanViewController ()

@property(weak, nonatomic) IBOutlet UILabel *up_str;        /** 上行总*/
@property(weak, nonatomic) IBOutlet UILabel *down_str;      /** 下行总*/
@property(weak, nonatomic) IBOutlet UILabel *rx_packets;    /** 收包*/
@property(weak, nonatomic) IBOutlet UILabel *tx_packets;    /** 发包*/
@property(weak, nonatomic) IBOutlet UILabel *rx_dropped;    /** 收丢包*/
@property(weak, nonatomic) IBOutlet UILabel *tx_dropped;    /** 发丢包*/
@property(weak, nonatomic) IBOutlet UILabel *rx_rate;       /** 收丢包率*/
@property(weak, nonatomic) IBOutlet UILabel *tx_rate;       /** 发丢包率*/
@property(weak, nonatomic) IBOutlet UILabel *code;          /** 状态 0成功，其它失败*/

@end

@implementation WanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0];
    [self wanAchieveFlowmeter];
}
- (IBAction)load:(UIBarButtonItem *)sender {
    [self wanAchieveFlowmeter];
}

- (void)dealloc{
    NSLog(@"WanViewController");
}
/**
 *  获取wan口信息请求
 */
-(void)wanAchieveFlowmeter{
    NSString *url = @"http://192.168.18.1/api/wan/get_traffics";
    [afnGETPOST GETURL:url prames:nil Reques:Requesjson Response:Responsejson success:^(id json) {
        [self updataUIdic:json];
    } failure:^(NSError *error) {
        NSLog(@"error-%@",error);
    }];
}
-(void)updataUIdic:(NSDictionary *)dic{
    if ([dic[@"code"] intValue] == 0) {
        self.up_str.text     = [self formoaterMbps:dic[@"up_str"]];
        self.down_str.text   = [self formoaterMbps:dic[@"down_str"]];
        self.rx_dropped.text = [self formoaterNumber:dic[@"rx_dropped"]];
        self.tx_dropped.text = [self formoaterNumber:dic[@"tx_dropped"]];
        self.rx_packets.text = [self formoaterNumber:dic[@"rx_packets"]];
        self.tx_packets.text = [self formoaterNumber:dic[@"tx_packets"]];
        self.rx_rate.text    = [self formoaterPercentage:dic[@"rx_rate"]];
        self.tx_rate.text    = [self formoaterPercentage:dic[@"tx_rate"]];
    }else return;
}

/**
 *  str转double 计算后在格式化为xx。xxMB
 */
-(NSString *)formoaterMbps:(NSString *)flowmeter{
    float mb = [flowmeter floatValue] /1024;
    NSString *meter = nil;
    
    if (mb <= 1024) {
        meter = [NSString stringWithFormat:@"%.2fMB",([flowmeter floatValue] /1024)];
    }else{
        meter = [NSString stringWithFormat:@"%.2fGB",([flowmeter floatValue] /1024/1024)];
    }
    return meter;
}

/**
 *  返回个数
 */
-(NSString *)formoaterNumber:(NSString *)text{

        return  [NSString stringWithFormat:@"%@个",text];
}

/**
  *  返回百分比
  */
-(NSString *)formoaterPercentage:(NSString *)text{

        return  [NSString stringWithFormat:@"%@%%",text];
    
}
@end
