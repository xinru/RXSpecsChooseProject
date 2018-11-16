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
//  CreditFlowerModel.m
//  DookayProject
//
//  Created by dookay_73 on 2018/11/12.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import "CreditFlowerModel.h"

@interface CreditFlowerModel()<YYModel>

@end

@implementation CreditFlowerModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{@"goodsList":[CreditGoodsModel class]};
}

@end


@implementation CreditGoodsModel

@end
