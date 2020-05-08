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
//  GoodsInfoCell.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsInfoCell.h"
//#import "HomeBannerView.h"

@interface GoodsInfoCell()

//@property (nonatomic, strong) HomeBannerView *bannerView;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *expressLabel;
@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation GoodsInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        _bannerView = [[HomeBannerView alloc] init];
//        _bannerView.backgroundColor = [UIColor orangeColor]
//        [self addSubview:_bannerView];
        
        _priceLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:18*ScaleX]
                                      text:@"￥1560-2340"
                                 textColor:[UIColor orangeColor]];
        [self addSubview:_priceLabel];
        
        _nameLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:15*ScaleX]
                                      text:@"玻纤布无碱玻璃纤维布耐高温防火隔热橡胶坚固耐用防火膨体陶瓷120mm"
                                 textColor:UIColorFromRGB(0x333333)];
        _nameLabel.numberOfLines = 0;
        [self addSubview:_nameLabel];
        
        _expressLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:12*ScaleX]
                                         text:@"快递：免运费"
                                    textColor:UIColorFromRGB(0x999999)];
        [self addSubview:_expressLabel];
        
        _numLabel = [MyTool labelWithFont:[MyTool regularFontWithSize:12*ScaleX]
                                      text:@"销量60"
                                 textColor:UIColorFromRGB(0x999999)];
        [self addSubview:_numLabel];
        
        
        
//        [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.right.equalTo(self);
//            make.height.mas_equalTo(120*ScaleX);
//        }];

        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(150*ScaleX);
            make.left.equalTo(self).offset(15*ScaleX);
        }];

        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_priceLabel.mas_bottom).offset(15*ScaleX);
            make.left.equalTo(self).offset(15*ScaleX);
            make.right.equalTo(self).offset(-15*ScaleX);
        }];

        [_expressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel.mas_left);
            make.top.equalTo(_nameLabel.mas_bottom).offset(15*ScaleX);
        }];

        [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_expressLabel.mas_right).offset(70*ScaleX);
            make.top.equalTo(_nameLabel.mas_bottom).offset(15*ScaleX);
        }];
    }
    return self;
}

@end
