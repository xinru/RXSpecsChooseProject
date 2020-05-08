//
//  DKJumpManager.m
//  DookayProject
//
//  Created by momo on 2017/11/14.
//  Copyright © 2017年 DookayProject. All rights reserved.
//

#import "DKJumpManager.h"

//#import "VCManager.h"

#import "BaseNavViewController.h"
//#import "BaseWebViewController.h"
//#import "LoginVC.h"

#import "GoodsDetailVC.h"
//#import "CartVC.h"

@implementation DKJumpManager
+ (void)presentLogInVC{
//    UIViewController *topVC = [[VCManager shareVCManager] getTopViewController];
//    LoginVC *vc = [[LoginVC alloc] init];
//    [topVC.navigationController pushViewController:vc animated:YES];
}


+ (void)presentWebVCWithTitle:(NSString *)title
                      loadUrl:(NSString *)loadUrl{
//    UIViewController *topVC = [[VCManager shareVCManager] getTopViewController];
//    if (topVC.navigationController) {
//        [self pushToWebVCWithNavgationVC:topVC.navigationController
//                                   title:title
//                                 loadUrl:loadUrl];
//    }else{
//        [self presentWebVCWithPresentedVC:topVC
//                                    title:title
//                                  loadUrl:loadUrl];
//    }
}

+ (void)presentWebVCWithPresentedVC:(UIViewController *)presentedVC
                              title:(NSString *)title
                            loadUrl:(NSString *)loadUrl{
    if (presentedVC) {
//        BaseWebViewController *webVC = [[BaseWebViewController alloc]init];
//        webVC.loadUrl = [NSURL URLWithString:loadUrl];
//        webVC.title = title;
//        [presentedVC presentViewController:[[BaseNavViewController alloc]initWithRootViewController:webVC]
//                                  animated:YES
//                                completion:nil];
    }
}

+ (void)pushToWebVCWithNavgationVC:(UINavigationController *)navgationVC
                             title:(NSString *)title
                           loadUrl:(NSString *)loadUrl{
    if (navgationVC) {
//        BaseWebViewController *webVC = [[BaseWebViewController alloc]init];
//        webVC.loadUrl = [NSURL URLWithString:loadUrl];
//        webVC.title = title;
//        [navgationVC pushViewController:webVC animated:YES];
//        [webVC.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

+ (void)pushToGoodsDetailVCWithNavgationVC:(UINavigationController *)navgationVC
                                   goodsID:(NSString *)goodsId
{
//    GoodsDetailVC *detailVC = [[GoodsDetailVC alloc] init];
//    detailVC.goodsId = goodsId;
//    if (!navgationVC) {
//        navgationVC = [[[VCManager shareVCManager] getTopViewController] navigationController];
//    }
//
//    [navgationVC pushViewController:detailVC animated:YES];
}

+ (void)pushToCartVCWithNavgationVC:(UINavigationController *)navgationVC
{
//    CartVC *vc = [[CartVC alloc] init];
//    vc.isPush = YES;
//    if (!navgationVC) {
//        navgationVC = [[[VCManager shareVCManager] getTopViewController] navigationController];
//    }
//    
//    [navgationVC pushViewController:vc animated:YES];
}

@end
