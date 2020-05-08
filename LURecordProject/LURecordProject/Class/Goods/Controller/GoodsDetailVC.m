
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
//  GoodsDetailVC.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsDetailVC.h"

//View
#import "GoodsInfoCell.h"
//#import "GoodsEvaluteCell.h"
#import "GoodsDetailCell.h"
#import "GoodsBuyToolBar.h"
#import "DKMoreButtonsView.h"
#import "ChooseView.h"
#import "ChooserSpecView.h"
#import "GoodsCommodityView.h"

//VC
#import "GoodsEvaluteVC.h"
//#import "OrderConfirmVC.h"

#define kGoodsInfoCellID        @"GoodsInfoCell.h"
//#define kGoodsEvaluteCellID     @"GoodsEvaluteCell"
#define kGoodsDetailCellID      @"GoodsDetailCell"

@interface GoodsDetailVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *titleBar;
//产品  详情  推荐
@property (nonatomic, strong) DKMoreButtonsView *btnsView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) GoodsBuyToolBar *toolBar;

//规格弹窗
@property (nonatomic, strong) ChooserSpecView *chooserView;

//产品推荐
@property (nonatomic, strong) GoodsCommodityView * commodityView;
@property (nonatomic, assign) CGFloat commodityHeight;

@end

@implementation GoodsDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.titleBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.toolBar];
    
    self.commodityView.data = @[@"", @"", @"", @"", @"", @""];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}
#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        GoodsInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:kGoodsInfoCellID];
        
        return cell;
    }else if (indexPath.section == 1){
        GoodsDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:kGoodsDetailCellID];
        
        return cell;
    }else{
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                       reuseIdentifier:@"commodityCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell addSubview:self.commodityView];
        return cell;
    }

    
}
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section
{
    _btnsView.selectedIndex = section;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 260*ScaleX;
    }else if (indexPath.section == 1){
        return 200*ScaleX;
    }else{
        return _commodityHeight;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10*ScaleX;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.01;
    }else{
        return 55*ScaleX;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return nil;
    }
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 0)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:16*ScaleX]
                                           text:@"产品详情"
                                      textColor:UIColorFromRGB(0x333333)];
    [view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(view).offset(15*ScaleX);
    }];
    if (section == 2) {
        titleLabel.text = @"产品推荐";
    }
//    if (section == 1) {
//        titleLabel.text = @"产品评价(216)";
//
//        UIButton *checkMore = [MyTool buttonWithImage:[UIImage imageNamed:@"checkMore"]
//                                        selectedImage:[UIImage imageNamed:@"checkMore"]];
//        [view addSubview:checkMore];
//        [checkMore addTarget:self
//                      action:@selector(clickedMoreEvaluteAction)
//            forControlEvents:UIControlEventTouchDown];
//        [checkMore mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(view).offset(-15*ScaleX);
//            make.centerY.equalTo(titleLabel);
//        }];
//
//        ChooseView *choose = [[ChooseView alloc] init];
//        [view addSubview:choose];
//        NSArray *dataArray = @[@"好评(180)", @"好评(180)", @"差评(2)"];
//        choose.dataArray = dataArray;
//        choose.nomalWidth = 84*ScaleX;
//
//        [choose mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.equalTo(view);
//            make.left.equalTo(view).offset(15*ScaleX);
//            make.top.equalTo(titleLabel.mas_bottom).offset(15*ScaleX);
//            make.height.mas_equalTo(_chooseHeight);
//        }];
//    }
    
    
    return view;
}

#pragma mark - action
- (void)clickedMoreEvaluteAction
{
    GoodsEvaluteVC *evaluteVC = [[GoodsEvaluteVC alloc] init];
    [self.navigationController pushViewController:evaluteVC animated:YES];
}
- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - getter

- (UIView *)titleBar
{
    if (!_titleBar) {
        
        CGFloat height = 64;
        CGFloat topY = 20;
        if (IS_IPHONE_X) {
            height = X_head+44;
            topY = X_head;
        }
        _titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, height)];
        
        UIButton *backBtn = [MyTool buttonWithImage:[UIImage imageNamed:@"icon_black_back_arrow"]
                                      selectedImage:[UIImage imageNamed:@"icon_black_back_arrow"]];
        [backBtn addTarget:self
                    action:@selector(backAction)
          forControlEvents:UIControlEventTouchDown];
        [_titleBar addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleBar).offset(8*ScaleX);
            make.width.height.mas_equalTo(44*ScaleX);
            make.top.equalTo(_titleBar).offset(topY);
        }];
        
        NSArray *array = @[@"产品", @"详情", @"推荐"];
        DKMoreButtonsView *btnsView = [[DKMoreButtonsView alloc] initWithFrame:CGRectMake((mainWidth- 240*ScaleX)/2, height-50*ScaleX, 240*ScaleX, 50*ScaleX)
                                                                   andBtnsName:array
                                                                   andIsCenter:YES];
        btnsView.btnNormalColor = UIColorFromRGB(0x333333);
        btnsView.btnSelectColor = UIColorFromRGB(0x333333);
        btnsView.btnNormalFont = [MyTool mediumFontWithSize:14*ScaleX];
        btnsView.btnSelectedFont = [MyTool mediumFontWithSize:14*ScaleX];
        btnsView.lineWidth = 28*ScaleX;
        WS(weakSelf);
        [btnsView setClickedBtnsBlock:^(NSInteger index) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:index];
            [weakSelf.tableView scrollToRowAtIndexPath:indexPath
                                      atScrollPosition:UITableViewScrollPositionTop
                                              animated:YES];
        }];
        [_titleBar addSubview:btnsView];
        _btnsView = btnsView;
    
        UIButton *shareBtn = [MyTool buttonWithImage:[UIImage imageNamed:@"icon_black_share"]
                                      selectedImage:[UIImage imageNamed:@"icon_black_share"]];
        [_titleBar addSubview:shareBtn];
        [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_titleBar).offset(-15*ScaleX);
            make.width.height.mas_equalTo(44*ScaleX);
            make.centerY.equalTo(btnsView);
        }];
    }
    return _titleBar;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        CGFloat footHeight = 0;
        if (IS_IPHONE_X) {
            footHeight = X_foot;
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, DEF_BOTTOM(self.titleBar), mainWidth, mainHeight- DEF_BOTTOM(self.titleBar)-50*ScaleX-footHeight)
                                                  style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.backgroundColor = UIColorFromRGB(0xF9F9F9);
        _tableView.separatorColor = [UIColor clearColor];
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        
        [_tableView registerClass:[GoodsInfoCell class]
           forCellReuseIdentifier:kGoodsInfoCellID];
        [_tableView registerClass:[GoodsDetailCell class]
           forCellReuseIdentifier:kGoodsDetailCellID];
        
        
    }
    return _tableView;
}
//        购买toolBar
- (GoodsBuyToolBar *)toolBar
{
    if (!_toolBar) {
        
        _toolBar = [[GoodsBuyToolBar alloc] initWithFrame:CGRectMake(0, DEF_BOTTOM(self.tableView), mainWidth, 50*ScaleX)];
        
        WS(weakSelf);
//        立即购买
        [_toolBar setClickBuyBlock:^{
            weakSelf.chooserView.chooserType = ChooserTypeBuy;
            [weakSelf.chooserView showAction];
        }];
        
//        添加购物车
        [_toolBar setClickJoinBlock:^{
            weakSelf.chooserView.chooserType = ChooserTypeCart;
            [weakSelf.chooserView showAction];
        }];
        
//        客服
        [_toolBar setClickServiceBlock:^{
//            [DKAlertView alertMessage:@"400-887-1300"
//                            leftTitle:@"取消"
//                           rightTitle:@"呼叫"
//                          leftHandler:nil
//                         rightHandler:^{
//                             NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"4008871300"];
//
//                             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//                         }];
        }];
        
//      跳转购物车
        [_toolBar setClickCartBlock:^{
            [DKJumpManager pushToCartVCWithNavgationVC:weakSelf.navigationController];
        }];
    }
    return _toolBar;
}
//选择器规格弹窗
- (ChooserSpecView *)chooserView
{
    if (!_chooserView) {
        _chooserView = [[ChooserSpecView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
        WS(weakSelf);
        [_chooserView setClickedConfirmBlock:^{
            if (weakSelf.chooserView.chooserType == ChooserTypeCart) {
                [MBProgressHUD showTipMessageInView:@"已成功添加进购物车"];
            }else{
                //            立即购买
//                OrderConfirmVC *confirmVC = [[OrderConfirmVC alloc] init];
//                [weakSelf.navigationController pushViewController:confirmVC animated:YES];
            }
        }];
    }
    return _chooserView;
}

- (GoodsCommodityView *)commodityView
{
    if (!_commodityView) {
        WS(weakSelf);
        _commodityView = [[GoodsCommodityView alloc]initWithShowLimit:YES heightBlock:^(CGFloat height) {
            weakSelf.commodityHeight = height;
            [weakSelf.tableView reloadData];
        } loadMore:^{
            //            if (_canLoadMore) {
            //                _page ++;
            //                [self pointsGoodsList];
            //            }else{
            //                return ;
            //            }
        }];
        [_commodityView removeLoadMore];
    }
    return _commodityView;
}

@end
