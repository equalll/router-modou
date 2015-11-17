//
//  appInfo.h
//  luyouqi
//
//  Created by xiong on 15/11/10.
//  Copyright © 2015年 xiong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appInfo : NSObject<NSCoding>
//author = lichao;
//"author_forum_id" = 52; ///???
//"author_mail" = "lichao-02@qq.com";
//description = "\U5e7f\U544a\U5c4f\U853d\U5927\U5e08\U53ef\U4ee5\U5168\U9762\U8fc7\U6ee4\U5404\U79cd\U6a2a\U5e45\U3001\U5f39\U7a97\U3001\U89c6\U9891\U5e7f\U544a\Uff0c\U540c\U65f6\U963b\U6b62\U8ddf\U8e2a\U3001\U9690\U79c1\U7a83\U53d6\U53ca\U5404\U79cd\U6076\U610f\U7f51\U7ad9";
//"display_name" = "adbyby\U53bb\U5e7f\U544a";
//"has_web_views" = 1;
//homepage = "www.lichao0223.cn";
//icon = "./res/icon.png";
//"icon_url" = "http://modouwifi.net:/internal_apps/com.lichao.adbyby/program/res/icon.png";
//id = adbyby;
//"install_date" = 1436833861;
//instruction = "\U5728\U914d\U7f6e\U4e2d\U53ef\U4ee5\U8fdb\U884c\U5404\U79cd\U914d\U7f6e\Uff0c\U8be6\U60c5\U53ef\U4ee5\U67e5\U770bhttp://www.adbyby.com/index.htm\U8fdb\U884c\U914d\U7f6e";
//isRunning = 0;
//"is_sys_app" = 0;
//location = internal;
//name = adbyby;
//"os_version" = "1.1.0";
//"package_id" = "com.lichao.adbyby";
//"release_date" = "2015.03.15";
//size = 871505;
//version = "1.2.0";
 /** */
@property (assign, nonatomic) BOOL     isRunning;        /** 插件运行状态*/
@property (assign, nonatomic) BOOL     is_sys_app;       /** 插件是系统app*/
@property (assign, nonatomic) BOOL     has_web_views;    /** 是否有web页面*/
@property (copy, nonatomic  ) NSString *author;          /** 作者*/
@property (copy, nonatomic  ) NSString *author_mail;     /** 作者e-mail*/
@property (copy, nonatomic  ) NSString *descriptions;    /** 插件信息*/
@property (copy, nonatomic  ) NSString *display_name;    /** 插件名字*/
@property (copy, nonatomic  ) NSString *homepage;        /** 插件主页*/
@property (copy, nonatomic  ) NSString *icon_url;        /** 图标链接*/
@property (copy, nonatomic  ) NSString *package_id;      /** 插件id*/
@property (copy, nonatomic  ) NSString *install_date;    /** 插件安装大小*/
@property (copy, nonatomic  ) NSString *size;            /** 插件大小*/
@property (copy, nonatomic  ) NSString *instruction;     /** 插件配置说明*/
@property (copy, nonatomic  ) NSString *version;         /** 插件版本信息*/
@property (copy, nonatomic  ) NSString *release_date;    /** 插件发布时间*/
@property (copy, nonatomic  ) NSString *change_log;      /** 插件更新信息*/
@end
