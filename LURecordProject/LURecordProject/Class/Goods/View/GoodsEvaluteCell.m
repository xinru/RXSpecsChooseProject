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
//  GoodsEvaluteCell.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsEvaluteCell.h"
#import "StarsView.h"

@interface GoodsEvaluteCell()

@property (nonatomic, strong) UIImageView *icon;

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) StarsView *starsView;

@end

@implementation GoodsEvaluteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _icon = [[UIImageView alloc] init];
        _icon.backgroundColor = [UIColor orangeColor];
        [self addSubview:_icon];
        
        _nameLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:13*ScaleX]
                                       text:@"小小侦查员"
                                  textColor:UIColorFromRGB(0x999999)];
        [self addSubview:_nameLabel];
        
        _contentLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:14*ScaleX]
                                       text:@"推荐大家来这里购买，服务又好，售后也棒质量和数量"
                                  textColor:UIColorFromRGB(0x333333)];
        _contentLabel.numberOfLines = 0;
        [self addSubview:_contentLabel];
        
        _timeLabel = [MyTool labelWithFont:[MyTool mediumFontWithSize:13*ScaleX]
                                     text:@"2019-01-16"
                                textColor:UIColorFromRGB(0x999999)];
        [self addSubview:_timeLabel];
        
        _starsView = [[StarsView alloc] init];
        _starsView.starCount = 3;
        [self addSubview:_starsView];
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(15*ScaleX);
            make.left.equalTo(self).offset(15*ScaleX);
            make.width.height.mas_equalTo(20*ScaleX);
        }];
        _icon.layer.cornerRadius = 10*ScaleX;
        _icon.layer.masksToBounds = YES;
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_icon.mas_right).offset(5*ScaleX);
            make.right.equalTo(self).offset(-115*ScaleX);
            make.top.equalTo(_icon);
        }];
        
        [_starsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15*ScaleX);
            make.height.mas_equalTo(12*ScaleX);
            make.centerY.equalTo(_icon);
            make.width.mas_equalTo(80*ScaleX);
        }];
        
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_icon);
            make.right.equalTo(self).offset(-20*ScaleX);
            make.top.equalTo(_icon.mas_bottom).offset(10*ScaleX);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_contentLabel.mas_right);
            make.bottom.equalTo(self).offset(-15*ScaleX);
        }];

        UIView *line = [[UIView alloc] init];
        line.backgroundColor = UIColorFromRGB(0xF5F5F5);
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}
@end
