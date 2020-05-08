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
//  ChooserSpecView.h
//  DookayProject
//
//  Created by dookay_73 on 2019/3/13.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ChooserTypeBuy,
    ChooserTypeCart,
} ChooserType;

@interface ChooserSpecView : UIView

- (void)showAction;

@property (nonatomic, assign) ChooserType chooserType;

@property (nonatomic, copy) void (^clickedConfirmBlock)(void);

@end

NS_ASSUME_NONNULL_END
