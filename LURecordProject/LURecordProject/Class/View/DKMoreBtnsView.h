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
//  DKMoreBtnsView.h
//  DookayProject
//
//  Created by dookay_73 on 2018/11/14.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKMoreBtnsView : UIView

- (instancetype)initWithArray:(NSArray *)array andSelectedName:(NSString *)value;

+ (CGFloat)getViewHeightWithArray:(NSArray *)array;

@property (nonatomic, copy) void (^clickedValueBlock)( DKMoreBtnsView *btnsView ,NSInteger value);

@end

NS_ASSUME_NONNULL_END
