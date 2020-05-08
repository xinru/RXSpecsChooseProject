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
//  StarsView.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/13.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "StarsView.h"

@interface StarsView()

@property (nonatomic, strong) NSMutableArray *imgViewsArray;

@end

@implementation StarsView

- (instancetype)init
{
    if ([super init]) {
      
        _imgViewsArray = [NSMutableArray array];
        
        for (int i = 0; i < 5; i++) {
            UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"star_normal"]];
            imgV.frame = CGRectMake(i*(17*ScaleX), 0, 12*ScaleX, 12*ScaleX);
            [self addSubview:imgV];
            [_imgViewsArray addObject:imgV];
        }
    }
    return self;
}

#pragma mark - 几颗星
- (void)setStarCount:(NSInteger)starCount
{
    _starCount = starCount;
    
    for (int i = 0; i < 5; i++) {
        UIImageView *imgV = _imgViewsArray[i];
        if (i < _starCount) {
            imgV.image = [UIImage imageNamed:@"star_selected"];
        }else{
            imgV.image = [UIImage imageNamed:@"star_normal"];
        }
    }
}



@end
