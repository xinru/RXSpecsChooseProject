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
//  DKMoreBtnsView.m
//  DookayProject
//
//  Created by dookay_73 on 2018/11/14.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import "DKMoreBtnsView.h"

@interface DKMoreBtnsView()

@property (nonatomic, strong) NSMutableArray *btnArray;

@end

@implementation DKMoreBtnsView

- (instancetype)initWithArray:(NSArray *)array andSelectedName:(nonnull NSString *)value
{
    if ([super init]) {
        _btnArray = [NSMutableArray array];
        [self buildSubViewsWithArray:array andSelectedName:value];
    }
    
    return self;
}

- (void)buildSubViewsWithArray:(NSArray *)array  andSelectedName:(nonnull NSString *)value
{
    CGFloat X = 20*ScaleX;
    CGFloat Y = 0;
    for (int i = 0; i < array.count; i++) {
        
//        NSDictionary *dic = array[i];
        
        NSString *str = array[i];
        
        UIButton *btn = [MyTool buttonWithTitle:str
                                     titleColor:UIColorFromRGB(0x999999)
                                      titleFont:[MyTool regularFontWithSize:12*ScaleX]];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        
        btn.layer.borderWidth = 1;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5*ScaleX;
        btn.tag = i;
        [self addSubview:btn];
        if ([value integerValue] == btn.tag) {
            btn.selected = YES;
            btn.backgroundColor = UIColorFromRGB(0xFF847B);
            btn.layer.borderColor = UIColorFromRGB(0xFF847B).CGColor;
        }else{
            btn.selected = NO;
            btn.backgroundColor = UIColorFromRGB(0xFFFFFF);
            btn.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
        }
        CGFloat btnWith = [MyTool getWidthWithStr:str andFont:[MyTool regularFontWithSize:12*ScaleX]];
        btnWith += 34*ScaleX;
        if ((X + btnWith) > (mainWidth - 20*ScaleX)) {
            X = 20*ScaleX;
            Y += 39*ScaleX;
        }
        btn.frame = CGRectMake(X, Y, btnWith, 24*ScaleX);
        X += (btnWith + 13*ScaleX);
        
        [btn addTarget:self
                action:@selector(clickedBtnAction:)
      forControlEvents:UIControlEventTouchDown];
        [_btnArray addObject:btn];
    }
    
    self.frame = CGRectMake(0, 0, mainWidth, Y + 24*ScaleX);

}

- (void)clickedBtnAction:(UIButton *)btn
{
    for (UIButton *button in _btnArray) {
        button.selected = NO;
        button.backgroundColor = UIColorFromRGB(0xFFFFFF);
        button.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
    }
    btn.selected = !btn.selected;
    if (btn.selected) {
        btn.backgroundColor = UIColorFromRGB(0xFF847B);
        btn.layer.borderColor = UIColorFromRGB(0xFF847B).CGColor;
    }else{
        btn.backgroundColor = UIColorFromRGB(0xFFFFFF);
        btn.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
    }
    self.clickedValueBlock(self, btn.tag);
}


+ (CGFloat)getViewHeightWithArray:(NSArray *)array
{
    DKMoreBtnsView *moreBtnView = [[DKMoreBtnsView alloc] initWithArray:array andSelectedName:@""];
    [moreBtnView layoutIfNeeded];
    return moreBtnView.height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
