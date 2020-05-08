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
//  CreditSpecView.h
//  DookayProject
//
//  Created by dookay_73 on 2018/11/13.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreditFlowerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CreditSpecView : UIView

@property (nonatomic, strong) CreditFlowerModel *model;

@property (nonatomic, strong) NSMutableArray *selectedSpecValueList;

- (void)show;

@property (nonatomic, copy) void (^clickedConfirmBlock)(NSInteger goodsId, NSInteger buyNum);
@property (nonatomic, copy) void (^updateSkuBlock)(NSInteger goodsId);

@end

NS_ASSUME_NONNULL_END
