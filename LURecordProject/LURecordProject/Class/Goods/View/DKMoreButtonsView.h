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
//  DKMoreButtonsView.h
//  DookayProject
//
//  Created by dookay_73 on 2018/5/31.
//  Copyright © 2018年 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DKMoreButtonsView : UIScrollView
/*
//以下两种方法二选一
 // 初始化的时候传btnNameArray
 // 做setter方法处理
 //isCenter 代表是否平分View的宽度
*/
- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray  andIsCenter:(BOOL)isCenter;

/*
 //以下两种方法二选一
 // 初始化的时候传btnNameArray
 // 做setter方法处理
 //isCenter 代表是否平分View的宽度
 //beyondScreen 数量较多时，是否滚动出屏幕
 */
- (instancetype)initWithFrame:(CGRect)frame andBtnsName:(NSArray *)btnNameArray beyondScreen:(BOOL)beyond;

@property (nonatomic, strong) NSArray *btnNameArray;

//当前的选中的位置
@property (nonatomic, assign) NSInteger selectedIndex;

//更改样式 button的字体和颜色、 线的颜色及宽高
@property (nonatomic, strong) UIFont *btnNormalFont;
@property (nonatomic, strong) UIFont *btnSelectedFont;
@property (nonatomic, strong) UIColor *btnNormalColor;
@property (nonatomic, strong) UIColor *btnSelectColor;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, assign) CGFloat lineHeight;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *bottomLineColor;

@property (nonatomic, copy) void (^clickedBtnsBlock)(NSInteger index);

@end
