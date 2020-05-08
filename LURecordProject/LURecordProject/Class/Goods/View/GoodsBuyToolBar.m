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
//  GoodsBuyToolBar.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsBuyToolBar.h"

@interface GoodsBuyToolBar()

@property (nonatomic, strong) UIButton *serviceBtn;
@property (nonatomic, strong) UIButton *cartBtn;
@property (nonatomic, strong) UIButton *joinBtn;
@property (nonatomic, strong) UIButton *buyBtn;

@end

@implementation GoodsBuyToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];

        
        [self dk_initSubviews];
    }
    return self;
}

- (void)dk_initSubviews
{
    
    _serviceBtn = [MyTool buttonWithImage:[UIImage imageNamed:@"buy_service"]
                            selectedImage:[UIImage imageNamed:@"buy_service"]];
    [_serviceBtn addTarget:self
                    action:@selector(dk_clickServiceAction)
          forControlEvents:UIControlEventTouchDown];
    [self addSubview:_serviceBtn];
    
    _cartBtn = [MyTool buttonWithImage:[UIImage imageNamed:@"buy_cart"]
                         selectedImage:[UIImage imageNamed:@"buy_cart"]];
    [_cartBtn addTarget:self
                 action:@selector(dk_clickCartAction)
       forControlEvents:UIControlEventTouchDown];
    [self addSubview:_cartBtn];
    
    
    _joinBtn = [MyTool buttonWithTitle:@"加入购物车"
                            titleColor:[UIColor whiteColor]
                             titleFont:[MyTool mediumFontWithSize:15*ScaleX]];
    [self addSubview:_joinBtn];
  
    _joinBtn.backgroundColor = UIColorFromRGB(0xED2241);
    [_joinBtn addTarget:self action:@selector(dk_clickJoinAction) forControlEvents:UIControlEventTouchDown];

    
    _buyBtn = [MyTool buttonWithTitle:@"立即购买"
                           titleColor:[UIColor whiteColor]
                            titleFont:[MyTool mediumFontWithSize:15*ScaleX]];

    _buyBtn.backgroundColor = [UIColor orangeColor];
    [_buyBtn addTarget:self action:@selector(dk_clickBuyAction) forControlEvents:UIControlEventTouchDown];
    [self addSubview:_buyBtn];
    
    [_serviceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20*ScaleX);
        make.top.equalTo(self).offset(10*ScaleX);
        
    }];
    
    [_cartBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_serviceBtn.mas_right).offset(30*ScaleX);
        make.centerY.equalTo(_serviceBtn);
    }];
    
    
    [_joinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_buyBtn.mas_left);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(120*ScaleX);
    }];
    
    [_buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(self);
        make.width.mas_equalTo(120*ScaleX);
    }];
    
}

#pragma mark - setter

- (void)setGoodsState:(int)goodsState
{
    if (goodsState == 1) {
        [self.joinBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 1) forState:UIControlStateNormal];
        [self.buyBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 1) forState:UIControlStateNormal];
        self.joinBtn.userInteractionEnabled = YES;
        self.buyBtn.userInteractionEnabled = YES;
    }else{
        [self.joinBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 0.5) forState:UIControlStateNormal];
        [self.buyBtn setTitleColor:UIColorFromRGBA(0xFFFFFF, 0.5) forState:UIControlStateNormal];
        self.joinBtn.userInteractionEnabled = NO;
        self.buyBtn.userInteractionEnabled = NO;
    }
}
#pragma mark - action

- (void)dk_clickServiceAction
{
    if (self.clickServiceBlock) {
        self.clickServiceBlock();
    }
    
}

- (void)dk_clickCartAction
{
    if (self.clickCartBlock) {
        self.clickCartBlock();
    }
}


- (void)dk_clickJoinAction
{
    if (self.clickJoinBlock) {
        self.clickJoinBlock();
    }
}

- (void)dk_clickBuyAction
{
    if (self.clickBuyBlock) {
        self.clickBuyBlock();
    }
}


@end
