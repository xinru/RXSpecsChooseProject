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
//  GoodsListCell.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/11.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsListCell.h"

@interface GoodsListCell()

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *cityLabel;
@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation GoodsListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = UIColorFromRGB(0xF9F9F9);
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(15*ScaleX);
            make.left.equalTo(self).offset(10*ScaleX);
            make.right.equalTo(self).offset(-10*ScaleX);
            make.height.mas_equalTo(130*ScaleX);
        }];
        bgView.layer.cornerRadius = 4*ScaleX;
        bgView.layer.masksToBounds = YES;
        
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor orangeColor];
        _icon.image = [UIImage imageNamed:@"goods_placeholder"];
        [self addSubview:_icon];
        
        _titleLabel = [MyTool labelWithFont:[MyTool regularFontWithSize:14*ScaleX]
                                       text:@"Wincell-duct WDSL赢胜面双面铝箔酚醛复合风管"
                                  textColor:UIColorFromRGB(0x333333)];
        _titleLabel.numberOfLines = 2;
        [self addSubview:_titleLabel];
        
        _priceLabel = [MyTool labelWithFont:[MyTool regularFontWithSize:16*ScaleX]
                                       text:@"面议"
                                  textColor:UIColorFromRGB(0xF6902A)];;
        [self addSubview:_priceLabel];
        
        _numLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:12*ScaleX]
                                     text:@"销量60        "
                                textColor:UIColorFromRGB(0x999999)];
        [self addSubview:_numLabel];
        
        _cityLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:12*ScaleX]
                                      text:@"广东"
                                 textColor:UIColorFromRGB(0x999999)];
        [self addSubview:_cityLabel];
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(30*ScaleX);
            make.left.equalTo(self).offset(25*ScaleX);
            make.width.height.mas_equalTo(100*ScaleX);
        }];
        _icon.layer.cornerRadius = 4*ScaleX;
        _icon.layer.masksToBounds = YES;
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_icon.mas_right).offset(15*ScaleX);
            make.right.equalTo(self).offset(-25*ScaleX);
            make.top.equalTo(_icon);
        }];
        
        [_cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_numLabel.mas_right);
            make.right.lessThanOrEqualTo(self).offset(-25*ScaleX);
            make.top.equalTo(_numLabel);
        }];

        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.bottom.equalTo(_numLabel.mas_top).offset(-15*ScaleX);
        }];
        
        [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_titleLabel);
            make.bottom.equalTo(_icon.mas_bottom);
        }];
        
    }
    return self;
}


@end
