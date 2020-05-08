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
//  GoodsListVC.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/11.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsListVC.h"
#import "GoodsListCell.h"
#import "DKMorebuttonsView.h"

#import "GoodsDetailVC.h"
#import "GoodsSearchVC.h"

#define kGoodsListCellID  @"GoodsListCell.h"

@interface GoodsListVC()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GoodsListVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"全部商品";
    
    WS(weakSelf);
    [self setRightButtonWithTitle:@""
                            Image:@"icon_product_search"
                    SelectedImage:@"icon_product_search"
                           Action:^{
                               GoodsSearchVC *searchVC = [[GoodsSearchVC alloc] init];
                               [weakSelf.navigationController pushViewController:searchVC animated:YES];
                           }];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsListCell *cell = [tableView dequeueReusableCellWithIdentifier:kGoodsListCellID];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsDetailVC *detailVC = [[GoodsDetailVC alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
}
#pragma mark - getter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, mainHeight)
                                                  style:UITableViewStyleGrouped];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.rowHeight = 145*ScaleX;
        
        _tableView.backgroundColor = UIColorFromRGB(0xF9F9F9);
        _tableView.separatorColor = [UIColor clearColor];
        
        NSArray *array = @[@"全部", @"橡塑保温", @"聚氨酯保温材料", @"岩棉", @"玻璃棉"];
        DKMoreButtonsView *btnsView = [[DKMoreButtonsView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 50*ScaleX)
                                                                   andBtnsName:array
                                                                   andIsCenter:NO];
        btnsView.btnNormalColor = UIColorFromRGB(0xAAAAAA);
        btnsView.btnNormalFont = [MyTool mediumFontWithSize:14*ScaleX];
        btnsView.btnSelectedFont = [MyTool mediumFontWithSize:14*ScaleX];
        btnsView.lineWidth = 28*ScaleX;
        [btnsView setClickedBtnsBlock:^(NSInteger index) {
            
        }];
        _tableView.tableHeaderView = btnsView;
        
        [_tableView registerClass:[GoodsListCell class]
           forCellReuseIdentifier:kGoodsListCellID];
    }
    return _tableView;
}
@end
