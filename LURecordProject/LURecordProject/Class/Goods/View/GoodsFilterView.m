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
//  GoodsFilterView.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/14.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsFilterView.h"
#import "ChooseView.h"

@interface GoodsFilterView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UIButton *sureBtn;

//@property (nonatomic, strong) NSMutableArray *specValueList;
@property (nonatomic, strong) NSMutableArray *rowHeightArray;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *selectedView;

@property (nonatomic, strong) UITextField *bottomPriceTF;
@property (nonatomic, strong) UITextField *topPriceTF;



@end

@implementation GoodsFilterView

- (void)showAction
{
    self.hidden = NO;
}
- (void)hiddenAction
{
    self.hidden = YES;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = UIColorFromRGBA(0x000000, 0.5);
        
        [self buildSubViews];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenAction)];
        [self addGestureRecognizer:tap];
        
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        self.hidden = YES;
    }
    return self;
}

- (void)buildSubViews
{
    UIView *headView = [[UIView alloc] init];
    
    headView.backgroundColor = [UIColor whiteColor];
    [self addSubview:headView];
    
    
    [self addSubview:self.tableView];
    [self addSubview:self.sureBtn];
    [self addSubview:self.cancelBtn];
    
    CGFloat bottomY = 0;
    CGFloat topY = 144*ScaleX;
    if (IS_IPHONE_X) {
        bottomY = X_foot;
        topY += X_head;
    }
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.left.equalTo(self).offset(120*ScaleX);
        make.height.mas_equalTo(140*ScaleX);
    }];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.bottom.equalTo(self).offset(-bottomY);
        make.height.mas_equalTo(50*ScaleX);
        make.width.mas_equalTo((mainWidth-120*ScaleX)/2);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.sureBtn.mas_left);
        make.centerY.equalTo(self.sureBtn);
        make.height.mas_equalTo(50*ScaleX);
        make.width.equalTo(self.sureBtn.mas_width);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self);
        make.left.equalTo(headView.mas_left);
        make.bottom.equalTo(self.sureBtn.mas_top);
    }];
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"apecCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    UILabel *label = [MyTool labelWithFont:[MyTool mediumFontWithSize:15*ScaleX]
                                      text:@"品牌"
                                 textColor:UIColorFromRGB(0x333333)];
    [cell addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(cell).offset(20*ScaleX);
    }];
    
    
    if (indexPath.row < 2) {
        if (indexPath.row == 1) {
            label.text = @"类型";
        }
        ChooseView *choose = [[ChooseView alloc] init];
        choose.dataArray = @[@"赢胜", @"赢胜"];
        choose.nomalWidth = 64*ScaleX;
        choose.index = 0;
        [cell addSubview:choose];
        [choose mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(label);
            make.top.equalTo(label.mas_bottom).offset(10*ScaleX);
            make.right.equalTo(cell).offset(-20*ScaleX);
            make.height.mas_equalTo(50*ScaleX);
        }];
    }else{
        label.text = @"价格区间（元）";
        [cell addSubview:self.selectedView];
        [self.selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell).offset(20*ScaleX);
            make.right.equalTo(cell).offset(-20*ScaleX);
            make.top.equalTo(label.mas_bottom).offset(10*ScaleX);
        }];
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        //        if (_rowHeightArray.count == 0) {
        //            return 10;
        //        }
        //        return [_rowHeightArray[indexPath.row] floatValue] + 50*ScaleX;
        return 100*ScaleX;
    }else{
        return 50*ScaleX;
    }
}

#pragma mark - action

- (void)sureBtnAction
{
    [self hiddenAction];
}
- (void)cancelBtnAction
{
    [self hiddenAction];
}
#pragma mark - getter
- (UIButton *)sureBtn
{
    if (!_sureBtn) {
        _sureBtn = [MyTool buttonWithTitle:@"确定"
                                   titleColor:[UIColor whiteColor]
                                    titleFont:[MyTool mediumFontWithSize:15*ScaleX]];
        _sureBtn.backgroundColor = [UIColor orangeColor];
        [_sureBtn addTarget:self
                        action:@selector(sureBtnAction)
              forControlEvents:UIControlEventTouchDown];
    }
    return _sureBtn;
}

- (UIButton *)cancelBtn
{
    if (!_cancelBtn) {
        _cancelBtn = [MyTool buttonWithTitle:@"重置"
                                titleColor:[UIColor whiteColor]
                                 titleFont:[MyTool mediumFontWithSize:15*ScaleX]];
        _cancelBtn.backgroundColor = [UIColor redColor];
        [_cancelBtn addTarget:self
                     action:@selector(cancelBtnAction)
           forControlEvents:UIControlEventTouchDown];
    }
    return _cancelBtn;
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 124*ScaleX, mainWidth, 236*ScaleX) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
    }
    return _tableView;
}

- (UIView *)selectedView
{
    if (!_selectedView) {
        _selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90*ScaleX, 34*ScaleX)];
        //        _selectedView.layer.borderColor = [UIColor colorWithRGB:0xDDDDDD].CGColor;
        //        _selectedView.layer.borderWidth = 1;
        //        _selectedView.layer.cornerRadius = 3*ScaleX;
        //        _selectedView.layer.masksToBounds = YES;
        _selectedView.backgroundColor = UIColorFromRGB(0xFAFAFA);
        
        [_selectedView addSubview:self.bottomPriceTF];
        [_selectedView addSubview:self.topPriceTF];
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = UIColorFromRGB(0xBEBEBE);
        [_selectedView addSubview:line];
        
        [self.bottomPriceTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_selectedView);
            make.top.equalTo(_selectedView);
            make.width.mas_equalTo(80*ScaleX);
            make.height.mas_equalTo(32*ScaleX);
        }];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bottomPriceTF.mas_right).offset(10*ScaleX);
            make.centerY.equalTo(self.bottomPriceTF);
            make.width.mas_equalTo(15*ScaleX);
            make.height.mas_equalTo(2*ScaleX);
        }];
        [self.topPriceTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(line.mas_right).offset(15*ScaleX);
            make.centerY.equalTo(self.bottomPriceTF);
            make.width.mas_equalTo(80*ScaleX);
            make.height.mas_equalTo(32*ScaleX);
        }];
    }
    return _selectedView;
}

- (UITextField *)bottomPriceTF
{
    if (!_bottomPriceTF) {
        _bottomPriceTF = [[UITextField alloc] init];
        _bottomPriceTF.text = @"";
        _bottomPriceTF.textColor = [UIColor lightGrayColor];
        _bottomPriceTF.font = [MyTool regularFontWithSize:12*ScaleX];
        _bottomPriceTF.textAlignment = NSTextAlignmentCenter;
        _bottomPriceTF.backgroundColor = UIColorFromRGB(0xF2F2F2);
        _bottomPriceTF.layer.cornerRadius = 16*ScaleX;
        _bottomPriceTF.layer.masksToBounds = YES;
    }
    return _bottomPriceTF;
}

- (UITextField *)topPriceTF
{
    if (!_topPriceTF) {
        _topPriceTF = [[UITextField alloc] init];
        _topPriceTF.text = @"";
        _topPriceTF.textColor = [UIColor lightGrayColor];
        _topPriceTF.font = [MyTool regularFontWithSize:12*ScaleX];
        _topPriceTF.textAlignment = NSTextAlignmentCenter;
        _topPriceTF.backgroundColor = UIColorFromRGB(0xF2F2F2);
        _topPriceTF.layer.cornerRadius = 16*ScaleX;
        _topPriceTF.layer.masksToBounds = YES;
    }
    return _topPriceTF;
}

@end
