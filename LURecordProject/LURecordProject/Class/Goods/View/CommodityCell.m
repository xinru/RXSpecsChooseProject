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
//  CommodityCell.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/15.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "CommodityCell.h"

@interface CommodityCell()

@property (nonatomic, strong) UIImageView *goodsIcon;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *nameLabel;


@end

@implementation CommodityCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        _goodsIcon = [[UIImageView alloc] init];
        _goodsIcon.backgroundColor = [UIColor orangeColor];
        [self addSubview:_goodsIcon];
        
        _priceLabel = [MyTool labelWithFont:[MyTool dinRegularFontWithSize:14*ScaleX]
                                       text:@"￥1560"
                                  textColor:[UIColor orangeColor]];
        [self addSubview:_priceLabel];
        
        _nameLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:13*ScaleX]
                                      text:@"玻纤布无碱玻璃纤维布耐高温防火隔热橡胶坚固耐用防火膨体陶瓷120mm"
                                 textColor:UIColorFromRGB(0x333333)];
        _nameLabel.numberOfLines = 2;
        [self addSubview:_nameLabel];
        
       
        [_goodsIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(100*ScaleX);
        }];
        _goodsIcon.layer.cornerRadius = 4*ScaleX;
        _goodsIcon.layer.masksToBounds = YES;
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_goodsIcon.mas_bottom).offset(10*ScaleX);
            make.left.equalTo(self);
            make.right.equalTo(self);
        }];
        
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nameLabel.mas_bottom).offset(5*ScaleX);
            make.left.equalTo(_nameLabel.mas_left);
        }];
     
    }
    return self;
}

@end
