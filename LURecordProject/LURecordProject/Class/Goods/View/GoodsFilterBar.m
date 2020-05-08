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
//  GoodsFilterBar.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/14.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsFilterBar.h"

@interface GoodsFilterBar()

@property (nonatomic, strong) UIView *line;

@end

@implementation GoodsFilterBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor orangeColor];
        
        NSArray *array = @[@"默认", @"销量", @"价格", @"筛选"];
        CGFloat btnWidth = self.width/array.count;
        for (int i = 0; i < array.count; i++) {
            UIButton *btn = [MyTool buttonWithTitle:array[i]
                                         titleColor:[UIColor whiteColor]
                                          titleFont:[MyTool mediumFontWithSize:14*ScaleX]];
            if (i == 2) {
                [btn setImage:[UIImage imageNamed:@"price_bottom"] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:@"price_top"] forState:UIControlStateSelected];
                [btn setTitle:@"" forState:UIControlStateNormal];
            }
            btn.tag = i;
            [btn addTarget:self
                    action:@selector(btnsAction:)
          forControlEvents:UIControlEventTouchDown];
            [self addSubview:btn];
            
            btn.frame = CGRectMake(btnWidth*i, 0, btnWidth, self.height);
        }
        
        _line = [[UIView alloc] init];
        _line.backgroundColor = [UIColor whiteColor];
        _line.frame = CGRectMake((btnWidth-30*ScaleX)/2, self.height - 3*ScaleX, 30*ScaleX, 3*ScaleX);
        [self addSubview:_line];
    }
    return self;
}

- (void)btnsAction:(UIButton *)btn
{
    if (btn.tag == 2) {
        btn.selected = !btn.selected;
    }
    
    _line.centerX = btn.centerX;
    
    if (self.clickedBlock) {
        self.clickedBlock(btn.tag);
    }
}
@end
