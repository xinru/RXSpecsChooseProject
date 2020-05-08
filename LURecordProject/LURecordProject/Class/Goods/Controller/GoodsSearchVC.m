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
//  GoodsSearchVC.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/14.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsSearchVC.h"
#import "ChooseView.h"
#import "GoodsListCell.h"
#import "GoodsFilterView.h"
#import "GoodsSearchBar.h"
#import "GoodsFilterBar.h"

#define kGoodsSearchListCellID  @"kGoodsSearchListCellID"

@interface GoodsSearchVC()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) GoodsSearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GoodsSearchVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.tableView];
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                                   reuseIdentifier:@"searchCell"];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;

//    UILabel *titleLabel = [MyTool labelWithFont:[MyTool semiboldFontWithSize:15*ScaleX]
//                                           text:@"历史搜索"
//                                      textColor:UIColorFromRGB(0x333333)];
//    [cell addSubview:titleLabel];
//
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(cell).offset(15*ScaleX);
//        make.top.equalTo(cell).offset(16*ScaleX);
//    }];
//
//    UIButton *deleteBtn = [MyTool buttonWithImage:[UIImage imageNamed:@"delete_gray"]
//                                    selectedImage:[UIImage imageNamed:@"delete_gray"]];
//    [cell addSubview:deleteBtn];
//    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(cell).offset(-15*ScaleX);
//        make.centerY.equalTo(cell);
//    }];
//
//    ChooseView *choose = [[ChooseView alloc] init];
//    choose.dataArray = @[@"玻璃棉价格", @"岩棉", @"隔热板", @"保温", @"橡塑保温", @"保温隔热板", @"复合", @"保温管", @"复合风管"];
//    choose.nomalBgColor = UIColorFromRGB(0xF3F3F3);
//    [cell addSubview:choose];
//
//    [choose mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(cell).offset(15*ScaleX);
//        make.right.equalTo(cell).offset(-15*ScaleX);
//        make.bottom.equalTo(cell);
//        make.top.equalTo(titleLabel.mas_bottom).offset(15*ScaleX);
//    }];

//    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goods_search_null"]];
//    [cell addSubview:imgV];
//    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(cell);
//        make.centerY.equalTo(cell).offset(-100*ScaleX);
//    }];
//    return cell;
    
    GoodsListCell *cell = [tableView dequeueReusableCellWithIdentifier:kGoodsSearchListCellID];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    return mainHeight;
    return 145*ScaleX;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50*ScaleX;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    GoodsFilterBar *filterBar = [[GoodsFilterBar alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 50*ScaleX)];
    [filterBar setClickedBlock:^(NSInteger index) {
        if (index == 3) {
            GoodsFilterView *filterView = [[GoodsFilterView alloc] initWithFrame:[UIScreen mainScreen].bounds];
            
            [filterView showAction];
        }
    }];
    return filterBar;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [DKJumpManager pushToGoodsDetailVCWithNavgationVC:self.navigationController
                                              goodsID:@""];
}
#pragma mark - getter
- (GoodsSearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[GoodsSearchBar alloc] init];
        
        WS(weakSelf);
        [_searchBar setClickedCancelBlock:^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
    }
    return _searchBar;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        
        CGFloat height = mainHeight - DEF_BOTTOM(self.searchBar);
        if (IS_IPHONE_X) {
            height = mainHeight - DEF_BOTTOM(self.searchBar) - X_foot;
        }
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, DEF_BOTTOM(self.searchBar), mainWidth, height)
                                                  style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;

        _tableView.backgroundColor = UIColorFromRGB(0xF9F9F9);
        _tableView.separatorColor = [UIColor clearColor];
        
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        
        [_tableView registerClass:[GoodsListCell class]
           forCellReuseIdentifier:kGoodsSearchListCellID];
        
//        GoodsFilterBar *filterBar = [[GoodsFilterBar alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 50*ScaleX)];
//        [filterBar setClickedBlock:^(NSInteger index) {
//
//        }];
//        _tableView.tableHeaderView = filterBar;
    }
    return _tableView;
}
@end
