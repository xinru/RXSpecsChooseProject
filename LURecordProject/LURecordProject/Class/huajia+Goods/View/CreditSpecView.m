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
//  CreditSpecView.m
//  DookayProject
//
//  Created by dookay_73 on 2018/11/13.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import "CreditSpecView.h"
#import "DKMoreBtnsView.h"

@interface CreditSpecView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, strong) UILabel *pointsLabel;
@property (nonatomic, strong) UILabel *priceLabel;

@property (nonatomic, strong) UIButton *confirmBtn;

//@property (nonatomic, strong) NSMutableArray *specValueList;
@property (nonatomic, strong) NSMutableArray *rowHeightArray;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *selectedView;
@property (nonatomic, strong) UIButton *addBtn;//+
@property (nonatomic, strong) UIButton *subtractBtn;//-
@property (nonatomic, strong) UITextField *numTF;

@property (nonatomic, assign) NSInteger goodsStorage;
@property (nonatomic, assign) NSInteger goodsId;

@end

@implementation CreditSpecView

- (void)show
{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}
- (void)hiddenAction
{
//    [self removeFromSuperview];
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
    }
    return self;
}

- (void)buildSubViews
{
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, mainHeight - 410*ScaleX, mainWidth, 124*ScaleX)];
    
    headView.backgroundColor = [UIColor clearColor];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 50*ScaleX, mainWidth, 74*ScaleX)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [headView addSubview:whiteView];
    
    [headView addSubview:self.imgV];
    [headView addSubview:self.pointsLabel];
    [headView addSubview:self.priceLabel];
     
     [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(headView).offset(20*ScaleX);
         make.top.equalTo(headView);
         make.width.height.mas_equalTo(100*ScaleX);
     }];
    [self.pointsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgV.mas_right).offset(15*ScaleX);
        make.top.equalTo(headView).offset(60*ScaleX);
        make.right.equalTo(headView).offset(-20*ScaleX);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pointsLabel.mas_left);
        make.top.equalTo(self.pointsLabel.mas_bottom).offset(5*ScaleX);
        make.right.equalTo(self.pointsLabel.mas_right);
    }];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(0xDDDDDD);
    [headView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(headView);
        make.height.mas_equalTo(1);
    }];
     
    [self addSubview:headView];
    self.tableView.frame = CGRectMake(0, DEF_BOTTOM(headView), mainWidth, 236*ScaleX);
    [self addSubview:self.tableView];
    [self addSubview:self.confirmBtn];
    _confirmBtn.frame = CGRectMake(0, DEF_BOTTOM(self.tableView), mainWidth, 50*ScaleX);
}

- (void)setModel:(CreditFlowerModel *)model
{
    _model = model;
    
    _selectedSpecValueList = [NSMutableArray array];
    
    _rowHeightArray = [NSMutableArray array];
//    _specValueList = [NSMutableArray array];

    for (NSDictionary *dic in model.specJson) {
        NSArray *array = dic[@"specValueList"];
//        NSMutableArray *nameArray = [NSMutableArray array];
//        for (NSDictionary *dict in array) {
//            [nameArray addObject:dict[@"specValueName"]];
//        }
//        [_specValueList addObject:nameArray];
        NSDictionary *valueDic = [array objectAtIndexCheck:0];
        [_selectedSpecValueList addObject:[NSString stringWithFormat:@"%@", valueDic[@"specValueId"]]];
        CGFloat height = [DKMoreBtnsView getViewHeightWithArray:array];
        [_rowHeightArray addObject:[NSString stringWithFormat:@"%f", height]];
    }
    [self.tableView reloadData];

    [self setupIsCanBuy];
    
    _imgV.yy_imageURL = [NSURL URLWithString:model.imageSrc];
//    _priceLabel.text = [NSString stringWithFormat:@"原价：￥%@", model.appPriceMin];
    _pointsLabel.text = [NSString stringWithFormat:@"需%@积分", model.expendPoints];
    
    NSString *textStr = [NSString stringWithFormat:@"原价：￥%.2f", [model.appPriceMin doubleValue]];
    //中划线
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:textStr attributes:attribtDic];
    // 赋值
    _priceLabel.attributedText = attribtStr;
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return _model.specJson.count;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"apecCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        UILabel *label = [MyTool labelWithFont:[MyTool mediumFontWithSize:14*ScaleX]
                                          text:_model.goodsSpecNameList[indexPath.row]
                                     textColor:UIColorFromRGB(0x000000)];
        [cell addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(cell).offset(20*ScaleX);
        }];
        if (_model.specJson.count > 0) {
            DKMoreBtnsView *moreBtnsView = [[DKMoreBtnsView alloc] initWithArray:_model.specJson[indexPath.row][@"specValueList"] andSelectedName:_selectedSpecValueList[indexPath.row]];
            moreBtnsView.tag = indexPath.row;
            [cell addSubview:moreBtnsView];
            [moreBtnsView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(label.mas_bottom).offset(15*ScaleX);
                make.left.right.equalTo(cell);
                make.height.mas_equalTo([_rowHeightArray[indexPath.row] floatValue]);
            }];
            WS(weakSelf);
            [moreBtnsView setClickedValueBlock:^(DKMoreBtnsView * _Nonnull btnsView, NSInteger value) {

                NSString *valueStr = [NSString stringWithFormat:@"%ld", (long)value];
                [weakSelf.selectedSpecValueList replaceObjectAtIndex:btnsView.tag withObject:valueStr];
                [weakSelf setupIsCanBuy];
//                NSInteger countNum = weakSelf.selectedSpecValueList.count;
//                if (countNum <= 0) {
//                    [weakSelf.selectedSpecValueList addObject:valueStr];
//                }else{
//                    if (btnsView.tag > countNum) {
//                        weakSelf.selectedSpecValueList
//                    }
//                }
            }];
        }
        
    }else{
        UILabel *label = [MyTool labelWithFont:[MyTool regularFontWithSize:12*ScaleX]
                                          text:@"数量"
                                     textColor:UIColorFromRGB(0x000000)];
        [cell addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(cell).offset(20*ScaleX);
        }];
        
        [cell addSubview:self.selectedView];
        [self.selectedView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell).offset(-20*ScaleX);
            make.centerY.equalTo(label);
            make.height.mas_equalTo(24*ScaleX);
            make.width.mas_equalTo(90*ScaleX);
        }];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (_rowHeightArray.count == 0) {
            return 10;
        }
        return [_rowHeightArray[indexPath.row] floatValue] + 50*ScaleX;
    }else{
        return 50*ScaleX;
    }
}

#pragma mark - action
- (BOOL)array:(NSArray *)array1 isEqualTo:(NSArray *)array2 {
    if (array1.count != array2.count) {
        return NO;
    }
    NSInteger num = 0;
    for (NSString *str in array1) {
        for (NSString *str2 in array2) {
            if ([str2 intValue] == [str intValue]) {
                num++;
                break;
            }
        }
    }
    if (num != array2.count) {
        return NO;
    }
    return YES;
    
}
//判断是否库存充足
- (void)setupIsCanBuy
{
    _goodsId = 0;
    for (NSDictionary *dic in _model.goodsSpecValueJson) {
        NSArray *specValueIds = dic[@"specValueIds"];
        
        if ([self array:specValueIds isEqualTo:_selectedSpecValueList]) {
            _goodsId = [dic[@"goodsId"] integerValue];
            break;
        }
    }
    
    for (CreditGoodsModel *goodsModel in _model.goodsList) {
        if ([goodsModel.goodsId integerValue] == _goodsId) {
            _imgV.yy_imageURL = [NSURL URLWithString:goodsModel.imageSrc];
            _goodsStorage = [goodsModel.goodsStorage integerValue];
            if ([goodsModel.goodsStorage integerValue] <= 0) {
                self.confirmBtn.userInteractionEnabled = NO;
                self.confirmBtn.backgroundColor = UIColorFromRGB(0x999999);
            }else{
                self.confirmBtn.userInteractionEnabled = YES;
                self.confirmBtn.backgroundColor = UIColorFromRGB(0xFF847B);
            }
            break;
        }
    }
    
    self.updateSkuBlock(_goodsId);
}


- (void)confirmBtnAction
{
    [self hiddenAction];
    self.clickedConfirmBlock(_goodsId, [self.numTF.text integerValue]);
}
- (void)clickedAddBtnAction
{
    if (_goodsStorage <= 0) {
        return;
    }
    NSInteger num = [self.numTF.text integerValue];

    num += 1;
    
    if (num > _goodsStorage) {
        num = _goodsStorage;
    }
    self.numTF.text = [NSString stringWithFormat:@"%ld", (long)num];
}

- (void)clickedSubtractBtnAction
{
    if (_goodsStorage <= 0) {
        return;
    }
    NSInteger num = [self.numTF.text integerValue];
    num -= 1;
    
    if (num <= 1) {
        num = 1;
    }
    self.numTF.text = [NSString stringWithFormat:@"%ld", (long)num];
}
#pragma mark - getter
- (UIImageView *)imgV
{
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        _imgV.layer.cornerRadius = 5*ScaleX;
        _imgV.layer.masksToBounds = YES;
    }
    return _imgV;
}

- (UILabel *)pointsLabel
{
    if (!_pointsLabel) {
        _pointsLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:14*ScaleX]
                                        text:@""
                                   textColor:UIColorFromRGB(0xFF0000)];
    }
    return _pointsLabel;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:14*ScaleX]
                                       text:@""
                                  textColor:UIColorFromRGB(0x000000)];
    }
    return _priceLabel;
}
- (UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [MyTool buttonWithTitle:@"我要换购"
                                   titleColor:[UIColor whiteColor]
                                    titleFont:[MyTool mediumFontWithSize:14*ScaleX]];
        _confirmBtn.backgroundColor = UIColorFromRGB(0xFF847B);
        [_confirmBtn addTarget:self
                        action:@selector(confirmBtnAction)
              forControlEvents:UIControlEventTouchDown];
    }
    return _confirmBtn;
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
        _selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 90*ScaleX, 24*ScaleX)];
        _selectedView.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
        _selectedView.layer.borderWidth = 1;
        _selectedView.layer.cornerRadius = 3*ScaleX;
        _selectedView.layer.masksToBounds = YES;
        
        [_selectedView addSubview:self.addBtn];
        [_selectedView addSubview:self.subtractBtn];
        [_selectedView addSubview:self.numTF];
        
        [_subtractBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_selectedView);
            make.top.equalTo(self->_selectedView).offset(-5.5*ScaleX);
            make.width.height.mas_equalTo(35*ScaleX);
        }];
        
        [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self->_selectedView);
            make.top.equalTo(self->_selectedView).offset(-5.5*ScaleX);
            make.width.height.mas_equalTo(35*ScaleX);
        }];
        
        [_numTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self->_addBtn.mas_left);
            make.left.equalTo(self->_subtractBtn.mas_right);
            make.top.bottom.equalTo(self->_selectedView);
        }];
    }
    return _selectedView;
}
- (UIButton *)addBtn
{
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] init];
        //        _addBtn.backgroundColor =[UIColor orangeColor];
        [_addBtn setImage:[UIImage imageNamed:@"加"] forState:UIControlStateNormal];
        [_addBtn addTarget:self action:@selector(clickedAddBtnAction) forControlEvents:UIControlEventTouchDown];
    }
    return _addBtn;
}

- (UIButton *)subtractBtn
{
    if (!_subtractBtn) {
        _subtractBtn = [[UIButton alloc] init];
        //        _subtractBtn.backgroundColor = [UIColor orangeColor];
        [_subtractBtn setImage:[UIImage imageNamed:@"减"] forState:UIControlStateNormal];
        [_subtractBtn addTarget:self action:@selector(clickedSubtractBtnAction) forControlEvents:UIControlEventTouchDown];
    }
    return _subtractBtn;
}

- (UITextField *)numTF
{
    if (!_numTF) {
        _numTF = [[UITextField alloc] init];
        _numTF.text = @"1";
        _numTF.textColor = UIColorFromRGB(0x888888);
        _numTF.font = [MyTool regularFontWithSize:12*ScaleX];
        _numTF.textAlignment = NSTextAlignmentCenter;
    }
    return _numTF;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
