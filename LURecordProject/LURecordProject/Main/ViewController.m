//
/*****************************************
 *                                       *
 *  @dookay.com Internet make it happen  *
 *  ----------- -----------------------  *
 *  dddd  ddddd Internet make it happen  *
 *  o   o     o Internet make it happen  *
 *  k    k    k Internet make it happen  *
 *  a   a     a Internet make it happen  *
 *  yyyy  yyyyy Internet make it happen  *
 *  ----------- -----------------------  *
 *  Say hello to the future.		     *
 *  hello，未来。                   	     *
 *  未来をその手に。                        *
 *                                       *
 *****************************************/
//
//  ViewController.m
//  LURecordProject
//
//  Created by dookay_73 on 2018/10/30.
//  Copyright © 2018 LU. All rights reserved.
//

#import "ViewController.h"
#import "Base/BaseNavViewController.h"
#import "CreditSpecView.h"
#import "CreditFlowerModel.h"
#import "DKMoreBtnsView.h"
#import "GoodsListVC.h"

@interface ViewController ()

@property (nonatomic, strong) CreditSpecView *specView;
@property (nonatomic, strong) CreditFlowerModel *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [MyTool buttonWithTitle:@"选择规格"];
    [btn addTarget:self
            action:@selector(enterVideoVC)
  forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
    }];
    
    UIButton *listBtn = [MyTool buttonWithTitle:@"多行buttons"];
    [listBtn addTarget:self
            action:@selector(enterVideoListVC)
  forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:listBtn];
    
    [listBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(btn.mas_bottom).offset(30);
    }];
    
   
}

- (void)enterVideoVC
{
    GoodsListVC *listVC = [[GoodsListVC alloc] init];
    [self.navigationController pushViewController:listVC animated:YES];
}

- (void)enterVideoListVC
{
    NSArray * array = @[@"AAAA", @"AAAAAAAAA", @"AAAAAAAAAAAA", @"AA", @"AAAAAAA", @"AAAAAAAAAAAAAAAA"];
    CGFloat height = [DKMoreBtnsView getViewHeightWithArray:array];
    DKMoreBtnsView *moreBtnsView = [[DKMoreBtnsView alloc] initWithArray:array andSelectedName:@"AA"];
    [self.view addSubview:moreBtnsView];
    [moreBtnsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(315*ScaleX);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(height);
    }];

    [moreBtnsView setClickedValueBlock:^(DKMoreBtnsView * _Nonnull btnsView, NSInteger value) {
        
        NSLog(@"%ld", (long)value);
     }];
}

@end
