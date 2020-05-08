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
//  GoodsEvaluteVC.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/13.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsEvaluteVC.h"
#import "GoodsEvaluteCell.h"
#import "ChooseView.h"

#define kGoodsEvaluteListCellID  @"GoodsEvaluteCellList"

@interface GoodsEvaluteVC()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GoodsEvaluteVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"全部评价";
    
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsEvaluteCell *cell = [tableView dequeueReusableCellWithIdentifier:kGoodsEvaluteListCellID];
    
    return cell;
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
        
        NSArray *array = @[@"全部", @"好评(180)", @"中评(96)", @"差评(2)"];
        ChooseView *choose = [[ChooseView alloc] init];
        choose.dataArray = array;
        choose.nomalWidth = 84*ScaleX;
        choose.index = 0;
        choose.frame = CGRectMake(15*ScaleX, 15*ScaleX, mainWidth-30*ScaleX, 89*ScaleX);
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, mainWidth, 104*ScaleX)];
        headView.backgroundColor = [UIColor whiteColor];
        [headView addSubview:choose];
        
        _tableView.tableHeaderView = headView;
        
        [_tableView registerClass:[GoodsEvaluteCell class]
           forCellReuseIdentifier:kGoodsEvaluteListCellID];
    }
    return _tableView;
}
@end
