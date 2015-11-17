//
//  TabBarViewController.m
//  luyouqi
//
//  Created by xiong on 15/11/5.
//  Copyright © 2015年 xiong. All rights reserved.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
-(void)awakeFromNib{
     [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Bold" size:16.0F], NSForegroundColorAttributeName : [UIColor colorWithRed:20/255.0 green:155/255.0 blue:213/255.0 alpha:1.0]} forState:UIControlStateSelected];
    
    for (UITabBarItem *item in self.tabBar.items) {
//        item.image =  [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage  = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }

//}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:YES];
//    for (UITabBarItem *item in self.tabBar.items) {
//        [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    }
//
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    for (UITabBarItem *item in self.tabBar.items) {
//        item.image =  [item.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        item.selectedImage  = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        
//    }
//
//}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//}
//

}
@end
