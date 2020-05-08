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
//  DKMoreButtonsView.m
//  DookayProject
//
//  Created by dookay_73 on 2018/5/31.
//  Copyright © 2018年 Dookay. All rights reserved.
//

#import "DKMoreButtonsView.h"

#define kSelectedColor  [UIColor orangeColor]
#define kNormalColor    UIColorFromRGB(0x333333)
#define KFont           [MyTool semiboldFontWithSize:14*ScaleX]
#define kFirstEdg       20*ScaleX
#define kEdg            20*ScaleX

@interface DKMoreButtonsView()

@property (nonatomic, strong) UIButton *selectedBtn;

@property (nonatomic, strong) NSMutableArray *btnsArray;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *bottomLine;

@property (nonatomic, assign) BOOL isCenter;
@property (nonatomic, assign) BOOL isBeyond;

@end

@implementation DKMoreButtonsView

- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        _btnsArray = [NSMutableArray array];
        
        _btnNameArray = btnNameArray;
        _isCenter = isCenter;
        
        [self dk_initSubViews:btnNameArray andIsCenter:isCenter];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray beyondScreen:(BOOL)beyond
{
    if ([super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        _btnsArray = [NSMutableArray array];
        
        _btnNameArray = btnNameArray;
        _isBeyond = beyond;
        
        [self dk_initSubViews:btnNameArray beyond:beyond];
        
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        _btnsArray = [NSMutableArray array];
    }
    return self;
}
- (void)dk_initSubViews:(NSArray *)btnNameArray andIsCenter:(BOOL)isCenter
{
    if (btnNameArray.count <= 0) {
        return;
    }

    CGFloat btnX = 0;
    CGFloat edg = 0;
    if (!isCenter) {
        btnX = kFirstEdg;
        edg = kEdg;
    }
    for (int i = 0; i < btnNameArray.count; i++) {
        
        CGFloat btnWidth;
        if (isCenter) {
            btnWidth = self.width / btnNameArray.count;

        }else{
            btnWidth = [MyTool getWidthWithStr:btnNameArray[i]
                                               andFont:KFont];
        }
        
        
        UIButton *btn = [MyTool buttonWithTitle:btnNameArray[i]
                                     titleColor:kNormalColor
                                      titleFont:KFont];
        [btn setTitleColor:kSelectedColor forState:UIControlStateSelected];
        btn.frame = CGRectMake(btnX, 0, btnWidth, self.height);
        btn.tag = i;
        [btn addTarget:self
                action:@selector(clickedBtnsAction:)
      forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        [_btnsArray addObject:btn];
        btnX += (btnWidth + edg);
    }
    
    self.contentSize = CGSizeMake(btnX + edg, self.height);
    

    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, btnX + 20*ScaleX, 0.5)];
    line.backgroundColor = UIColorFromRGB(0xEEEEEE);
    [self addSubview:line];

    _bottomLine = line;

    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = kSelectedColor;
    _lineView.frame = CGRectMake(0, self.height-4, 0, 2*ScaleX);
    [self addSubview:_lineView];
    
    self.selectedIndex = 0;
}

- (void)dk_initSubViews:(NSArray *)btnNameArray beyond:(BOOL)beyond
{
    if (btnNameArray.count <= 0) {
        return;
    }
    
    CGFloat btnX = kFirstEdg/2;
    for (int i = 0; i < btnNameArray.count; i++) {
        
        CGFloat btnWidth = (self.width - (btnNameArray.count -1)*kEdg-kFirstEdg) / btnNameArray.count;
        
        
        UIButton *btn = [MyTool buttonWithTitle:btnNameArray[i]
                                     titleColor:kNormalColor
                                      titleFont:KFont];
        [btn setTitleColor:kSelectedColor forState:UIControlStateSelected];
        btn.frame = CGRectMake(btnX, 0, btnWidth, self.height);
        btn.tag = i;
        [btn addTarget:self
                action:@selector(clickedBtnsAction:)
      forControlEvents:UIControlEventTouchDown];
        [self addSubview:btn];
        [_btnsArray addObject:btn];
        btnX += (btnWidth + kEdg);
    }
    
    self.contentSize = CGSizeMake(mainWidth, self.height);
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, self.height-1, mainWidth, 0.5)];
    line.backgroundColor = UIColorFromRGB(0xEEEEEE);
    [self addSubview:line];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = kSelectedColor;
    _lineView.frame = CGRectMake(0, self.height-4, 0, 2*ScaleX);
    [self addSubview:_lineView];
    
    self.selectedIndex = 0;
}

#pragma mark - 更新SubView的frame  待完成
- (void)updateSubViewsFrame
{
    CGFloat btnX = 0;
    if (!_isCenter) {
        btnX = kFirstEdg;
    }
    for (int i = 0; i < _btnNameArray.count; i++) {
        
        UIButton *btn = _btnsArray[i];
        CGFloat btnWidth;
        if (_isCenter) {
            btnWidth = self.width / _btnNameArray.count;

        }else{
            btnWidth = [MyTool getWidthWithStr:_btnNameArray[i]
                                       andFont:KFont];
        }
    
        btn.frame = CGRectMake(btnX, 0, btnWidth, self.height);
        btnX += (btnWidth + kEdg);
    }
}

#pragma mark - setter
- (void)setLineColor:(UIColor *)lineColor
{
    _lineView.backgroundColor = lineColor;
}
- (void)setLineHeight:(CGFloat)lineHeight
{
    _lineView.height = lineHeight;
}
- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    _lineView.width = lineWidth;
    self.lineView.centerX = self.selectedBtn.centerX;
}
- (void)setBtnNormalColor:(UIColor *)btnNormalColor
{
    for (UIButton *btn in _btnsArray) {
        [btn setTitleColor:btnNormalColor forState:UIControlStateNormal];
    }
}

-(void)setBtnSelectColor:(UIColor *)btnSelectColor
{
    for (UIButton *btn in _btnsArray) {
        [btn setTitleColor:btnSelectColor forState:UIControlStateSelected];
    }
}

- (void)setBtnNormalFont:(UIFont *)btnNormalFont
{
    _btnNormalFont = btnNormalFont;
    for (UIButton *btn in _btnsArray) {
        btn.titleLabel.font = btnNormalFont;
    }
//    [self updateSubViewsFrame];
}
- (void)setBtnSelectedFont:(UIFont *)btnSelectedFont
{
    _btnSelectedFont = btnSelectedFont;
    self.selectedBtn.titleLabel.font = btnSelectedFont;
}
- (void)setBtnNameArray:(NSArray *)btnNameArray
{
    [self removeAllSubviews];
    
    [self dk_initSubViews:btnNameArray andIsCenter:NO];
}

- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    self.selectedBtn = _btnsArray[selectedIndex];
    
    for (UIButton *btn in _btnsArray) {
        btn.selected = NO;
        if (_btnNormalFont) {
            btn.titleLabel.font = _btnNormalFont;
        }
    }

    self.selectedBtn.selected = YES;
    if (_btnSelectedFont) {
        self.selectedBtn.titleLabel.font = _btnSelectedFont;
    }
    if (_lineWidth <= 0) {
        CGFloat btnWidth = [MyTool getWidthWithStr:_selectedBtn.titleLabel.text
                                           andFont:self.selectedBtn.titleLabel.font];
        self.lineView.width = btnWidth;
    }
    
    self.lineView.centerX = self.selectedBtn.centerX;
}

- (void)setBottomLineColor:(UIColor *)bottomLineColor
{
    _bottomLine.backgroundColor = bottomLineColor;
}
#pragma mark - action
- (void)clickedBtnsAction:(UIButton *)btn
{
    self.clickedBtnsBlock(btn.tag);
    [UIView animateWithDuration:0.3 animations:^{
        self.selectedIndex = btn.tag;
    }];
}

@end
