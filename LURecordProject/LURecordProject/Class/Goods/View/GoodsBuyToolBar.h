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
//  GoodsBuyToolBar.h
//  DookayProject
//
//  Created by dookay_73 on 2019/3/12.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodsBuyToolBar : UIView


@property (nonatomic, assign) int goodsState;//goodsState int 商品状态(可以购买1，不可购买0)

@property (nonatomic, copy) void (^clickServiceBlock)(void);
@property (nonatomic, copy) void (^clickCartBlock)(void);


@property (nonatomic, copy) void (^clickJoinBlock)(void);
@property (nonatomic, copy) void (^clickBuyBlock)(void);

@end

NS_ASSUME_NONNULL_END
