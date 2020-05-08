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
//  ChooseView.h
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChooseView : UIView

//数据源
@property (nonatomic, strong) NSArray *dataArray;
//传0 为subview的宽度依据文本而定， 大于0 是默认不少于这个宽度
@property (nonatomic, assign) CGFloat nomalWidth;

//s属性
//选中的index
@property (nonatomic, assign) NSInteger index;
//默认的背景色
@property (nonatomic, strong) UIColor *nomalBgColor;
////选中的背景色
//@property (nonatomic, strong) UIColor *selectedBGColor;

//获取高度
+ (CGFloat)getChooseViewHeightWithArray:(NSArray *)array nomalWidth:(CGFloat)width  viewWidth:(CGFloat)viewWidth;

@end

NS_ASSUME_NONNULL_END
