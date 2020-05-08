//
//  MemberCenterCommodityView.h
//  DookayProject
//
//  Created by 褚平欧 on 2018/11/12.
//  Copyright © 2018 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CenterCommodityHeightBlock)(CGFloat height);

typedef void(^CenterCommodityLoadMoreBlock)(void);

@interface GoodsCommodityView : UIView

-(instancetype)initWithTitle:(NSString *)title showLimit:(BOOL)show heightBlock:(CenterCommodityHeightBlock)height loadMore:(CenterCommodityLoadMoreBlock)more;

@property (nonatomic , strong) NSArray * data;


-(void)removeLoadMore;


@end

NS_ASSUME_NONNULL_END
