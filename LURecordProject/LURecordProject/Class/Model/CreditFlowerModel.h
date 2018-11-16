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
//  CreditFlowerModel.h
//  DookayProject
//
//  Created by dookay_73 on 2018/11/12.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class CreditGoodsModel;

@interface CreditFlowerModel : NSObject

@property (nonatomic, strong) NSArray *goodsImageList;// 商品图片列表
@property (nonatomic, strong) NSArray *currentGoodsImageList;// 当前商品图片列表

@property (nonatomic, strong) NSString *goodsName;// String 商品名称
@property (nonatomic, strong) NSString *appPriceMin;//BigDecimal 商品价格
@property (nonatomic, strong) NSString *jingle;// String 商品卖点
@property (nonatomic, strong) NSString *expendPoints;// int 所需积分
@property (nonatomic, strong) NSString *limitMemberGradeLevel;// int 领取积分商品限制的会员等级
@property (nonatomic, strong) NSString *limitMemberGradeName;//  String 领取积分商品限制的会员等级名称
@property (nonatomic, strong) NSArray <CreditGoodsModel *> *goodsList;//[] 商品列表
@property (nonatomic, strong) NSString *commonId;// int 商品SPU编号
@property (nonatomic, strong) NSString *pointsGoodsId;
@property (nonatomic, strong) NSString *imageSrc;// String 图片路径

@property (nonatomic, strong) NSArray *mobileBodyVoList;//图片详情
@property (nonatomic, strong) NSArray *specJson;//规格数组
@property (nonatomic, strong) NSArray *goodsSpecNameList;//规格数组
@property (nonatomic, strong) NSArray *goodsSpecValueJson;//规格数组

@property (nonatomic, assign) CGFloat rowHeight;

@end

@interface CreditGoodsModel : NSObject

@property (nonatomic, strong) NSString *appPrice0;
@property (nonatomic, strong) NSString *goodsSpecString;
@property (nonatomic, strong) NSString *goodsStorage;
@property (nonatomic, strong) NSString *imageName;
//@property (nonatomic, strong) NSString *limitMemberGradeLevel;// int 领取积分商品限制的会员等级
@property (nonatomic, strong) NSString *colorId;
@property (nonatomic, strong) NSString *goodsId;
@property (nonatomic, strong) NSString *commonId;// int 商品SPU编号
@property (nonatomic, strong) NSString *imageSrc;// String 图片路径

@end

NS_ASSUME_NONNULL_END
