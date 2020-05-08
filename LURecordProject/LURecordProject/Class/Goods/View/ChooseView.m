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
//  ChooseView.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "ChooseView.h"

@interface ChooseView()

@property (nonatomic, strong) NSMutableArray *subViewsArray;

@property (nonatomic, strong) UILabel *selectedLabel;


@property (nonatomic, assign) CGFloat chooseViewHeight;


@end

@implementation ChooseView

- (instancetype)init
{
    if ([super init]) {
        _index = -1;
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat topX = 0;
    CGFloat topY = 0;
    for (int i = 0; i < _subViewsArray.count; i++) {
        
        NSString *text = _dataArray[i];
        
        UILabel *label = _subViewsArray[i];
        
        CGFloat subViewWidth = [MyTool getWidthWithStr:text andFont:label.font] + 30*ScaleX;
        if (_nomalWidth > 0) {
            if (subViewWidth < _nomalWidth) {
                subViewWidth = _nomalWidth;
            }
        }
        
        if (subViewWidth + topX > self.width) {
            topY += 42*ScaleX;
            topX = 0;
        }
        label.frame = CGRectMake(topX, topY, subViewWidth, 32*ScaleX);
        topX += (subViewWidth + 10*ScaleX);
        
        label.layer.cornerRadius = 16*ScaleX;
        label.layer.masksToBounds = YES;
        
        
    }
    
    _chooseViewHeight = topY + 32*ScaleX +15*ScaleX;
    
}

#pragma mark - action
- (void)changeIndexAction:(UITapGestureRecognizer *)tapGest
{
    self.index = tapGest.view.tag;
}
#pragma  mark - setter

- (void)setDataArray:(NSArray *)dataArray
{
    _dataArray = dataArray;
    [self removeAllSubviews];
    _subViewsArray = [NSMutableArray array];
    for (int i = 0; i < _dataArray.count; i++) {
        
        NSString *text = _dataArray[i];
        
        UILabel *label = [MyTool labelWithFont:[MyTool mediumFontWithSize:13*ScaleX]
                                          text:text
                                     textColor:UIColorFromRGB(0x333333)];
        label.backgroundColor = UIColorFromRGBA(0xCF1227, 0.06);
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = i;
        [self addSubview:label];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(changeIndexAction:)];
        [label addGestureRecognizer:tap];
        
        [_subViewsArray addObject:label];
    }
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    for (UILabel *label in _subViewsArray) {
        label.userInteractionEnabled = YES;
        label.backgroundColor = UIColorFromRGB(0xF5F5F5);
        label.layer.borderWidth = 0;
        label.textColor = UIColorFromRGB(0x333333);
    }
    _selectedLabel = _subViewsArray[_index];
    _selectedLabel.backgroundColor = UIColorFromRGBA(0xCF1227, 0.06);
    _selectedLabel.layer.borderWidth = 1;
    _selectedLabel.layer.borderColor = [UIColor orangeColor].CGColor;
    _selectedLabel.textColor = [UIColor orangeColor];
}

- (void)setNomalBgColor:(UIColor *)nomalBgColor
{
    for (UILabel *label in _subViewsArray) {
        label.backgroundColor = nomalBgColor;
    }
}

#pragma mark - height
+ (CGFloat)getChooseViewHeightWithArray:(NSArray *)array nomalWidth:(CGFloat)width  viewWidth:(CGFloat)viewWidth
{
    ChooseView *choose = [[ChooseView alloc] initWithFrame:CGRectMake(0, 0, viewWidth, 0)];
    
    choose.dataArray = array;
    choose.nomalWidth = width;

    [choose layoutIfNeeded];
    
    return choose.chooseViewHeight;
}

@end
