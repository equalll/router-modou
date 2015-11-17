//
//  appInfo.m
//  luyouqi
//
//  Created by xiong on 15/11/10.
//  Copyright © 2015年 xiong. All rights reserved.
//

#import "appInfo.h"
#import "MJExtension.h"

@implementation appInfo
MJCodingImplementation
-(void)setIcon_url:(NSString *)icon_url{
    _icon_url = icon_url;
    
    NSString *str = @"modouwifi.net:";
    NSString *wtStr = @"192.168.18.1";
    NSString *currenstr = [icon_url stringByReplacingOccurrencesOfString:str withString:wtStr];
    _icon_url = currenstr;
    
}

@end
