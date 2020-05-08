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
//  ChooserSpecView.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/13.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "ChooserSpecView.h"
#import "ChooseView.h"

@interface ChooserSpecView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, strong) UILabel *nameLabel;
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

@implementation ChooserSpecView

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
    
    [headView addSubview:self.imgV];
    [headView addSubview:self.nameLabel];
    [headView addSubview:self.priceLabel];
    
    [self.imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView).offset(20*ScaleX);
        make.top.equalTo(headView).offset(20*ScaleX);
        make.width.height.mas_equalTo(100*ScaleX);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgV.mas_right).offset(15*ScaleX);
        make.top.equalTo(_imgV);
        make.right.equalTo(headView).offset(-55*ScaleX);
    }];
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.bottom.equalTo(self.imgV.mas_bottom);
        make.right.equalTo(headView).offset(-55*ScaleX);
    }];
    

    [self addSubview:self.tableView];
    [self addSubview:self.confirmBtn];
    
    CGFloat bottomY = 0;
    CGFloat topY = 144*ScaleX;
    if (IS_IPHONE_X) {
        bottomY = X_foot;
        topY += X_head;
    }
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self).offset(topY);
        make.height.mas_equalTo(140*ScaleX);
    }];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).offset(-bottomY);
        make.height.mas_equalTo(50*ScaleX);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(headView.mas_bottom);
        make.bottom.equalTo(self.confirmBtn.mas_top);
    }];
}

#pragma mark - setter
- (void)setChooserType:(ChooserType)chooserType
{
    _chooserType = chooserType;
    if (chooserType == ChooserTypeCart) {
        [self.confirmBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    }else{
        [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    }
}
#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 3;
    }else{
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"apecCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        UILabel *label = [MyTool labelWithFont:[MyTool mediumFontWithSize:15*ScaleX]
                                          text:@"品牌"
                                     textColor:UIColorFromRGB(0x333333)];
        [cell addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(cell).offset(20*ScaleX);
        }];
        
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
        UILabel *label = [MyTool labelWithFont:[MyTool mediumFontWithSize:15*ScaleX]
                                          text:@"购买数量"
                                     textColor:UIColorFromRGB(0x333333)];
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
        
        UILabel *totalNumLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:13*ScaleX]
                                                  text:@"库存120件"
                                             textColor:UIColorFromRGB(0x666666)];
        [cell addSubview:totalNumLabel];
        [totalNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.selectedView.mas_left).offset(-12*ScaleX);
            make.centerY.equalTo(label);
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
//- (void)setupIsCanBuy
//{
//    _goodsId = 0;
//    for (NSDictionary *dic in _model.goodsSpecValueJson) {
//        NSArray *specValueIds = dic[@"specValueIds"];
//
//        if ([self array:specValueIds isEqualTo:_selectedSpecValueList]) {
//            _goodsId = [dic[@"goodsId"] integerValue];
//            break;
//        }
//    }
//
//    for (CreditGoodsModel *goodsModel in _model.goodsList) {
//        if ([goodsModel.goodsId integerValue] == _goodsId) {
//            _imgV.yy_imageURL = [NSURL URLWithString:goodsModel.imageSrc];
//            _goodsStorage = [goodsModel.goodsStorage integerValue];
//            if ([goodsModel.goodsStorage integerValue] <= 0) {
//                self.confirmBtn.userInteractionEnabled = NO;
//                self.confirmBtn.backgroundColor = UIColorFromRGB(0x999999);
//            }else{
//                self.confirmBtn.userInteractionEnabled = YES;
//                self.confirmBtn.backgroundColor = UIColorFromRGB(0xFF847B);
//            }
//            break;
//        }
//    }
//
//    self.updateSkuBlock(_goodsId);
//}


- (void)confirmBtnAction
{
    [self hiddenAction];
    self.clickedConfirmBlock();
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
        _imgV.backgroundColor = [UIColor orangeColor];
    }
    return _imgV;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [MyTool labelWithFont:[MyTool regularFontWithSize:14*ScaleX]
                                        text:@"1公分厚10mm厚空调硬管冷气"
                                   textColor:UIColorFromRGB(0x333333)];
    }
    return _nameLabel;
}
- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:16*ScaleX]
                                       text:@"￥1560"
                                  textColor:UIColorFromRGB(0xF6902A)];
    }
    return _priceLabel;
}
- (UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        _confirmBtn = [MyTool buttonWithTitle:@"确定"
                                   titleColor:[UIColor whiteColor]
                                    titleFont:[MyTool mediumFontWithSize:15*ScaleX]];
        _confirmBtn.backgroundColor = [UIColor orangeColor];
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
//        _selectedView.layer.borderColor = [UIColor colorWithRGB:0xDDDDDD].CGColor;
//        _selectedView.layer.borderWidth = 1;
//        _selectedView.layer.cornerRadius = 3*ScaleX;
//        _selectedView.layer.masksToBounds = YES;
        _selectedView.backgroundColor = UIColorFromRGB(0xFAFAFA);
        
        [_selectedView addSubview:self.addBtn];
        [_selectedView addSubview:self.subtractBtn];
        [_selectedView addSubview:self.numTF];
        
        [_subtractBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_selectedView);
            make.top.equalTo(_selectedView).offset(-5.5*ScaleX);
            make.width.height.mas_equalTo(35*ScaleX);
        }];
        
        [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_selectedView);
            make.top.equalTo(_selectedView).offset(-5.5*ScaleX);
            make.width.height.mas_equalTo(35*ScaleX);
        }];
        
        [_numTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_addBtn.mas_left);
            make.left.equalTo(_subtractBtn.mas_right);
            make.top.bottom.equalTo(_selectedView);
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
        _numTF.textColor = [UIColor lightGrayColor];
        _numTF.font = [MyTool regularFontWithSize:12*ScaleX];
        _numTF.textAlignment = NSTextAlignmentCenter;
        _numTF.backgroundColor = UIColorFromRGB(0xF2F2F2);
    }
    return _numTF;
}


@end
