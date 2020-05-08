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
//  GoodsSearchBar.m
//  DookayProject
//
//  Created by dookay_73 on 2019/3/14.
//  Copyright © 2019 Dookay. All rights reserved.
//

#import "GoodsSearchBar.h"

@interface GoodsSearchBar()

@property (nonatomic, strong) UITextField *searchField;

@end

@implementation GoodsSearchBar

- (instancetype)init
{
    if ([super init]) {
        
        
        self.backgroundColor = [UIColor orangeColor];
        
        CGFloat height = IS_IPHONE_X?X_head:20;
        
        self.frame = CGRectMake(0, 0, mainWidth, height+44);
      
        UIView * white = [[UIView alloc]initWithFrame:CGRectMake(15*ScaleX, height+6, 300*ScaleX, 32)];
        white.backgroundColor = [UIColor whiteColor];
        white.layer.cornerRadius = 16*ScaleX;
        white.layer.masksToBounds = YES;
        [self addSubview:white];
    
        _searchField = [[UITextField alloc]initWithFrame:CGRectMake(15*ScaleX, 0, 270*ScaleX, 32*ScaleX)];
        _searchField.font = [MyTool regularFontWithSize:13*ScaleX];
        _searchField.placeholder = @"请输入商品名称";
        _searchField.leftViewMode = UITextFieldViewModeAlways;
        _searchField.rightViewMode = UITextFieldViewModeWhileEditing;
        UIImageView * left = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"search_icon"]];
        left.frame = CGRectMake(0, 0, 15*ScaleX, 15*ScaleX);
        _searchField.leftView = left;
    
        UIButton * clear = [MyTool buttonWithImage:[UIImage imageNamed:@"clear_icon"] selectedImage:nil];
        clear.frame = CGRectMake(0, 0, 18*ScaleX, 18*ScaleX);
        [clear addTarget:self action:@selector(clearBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _searchField.rightView = clear;
        [white addSubview:_searchField];
    
        UIButton * cancel = [MyTool buttonWithTitle:@"取消" titleColor:[UIColor whiteColor] titleFont:[MyTool regularFontWithSize:15*ScaleX]];
        cancel.frame = CGRectMake(315*ScaleX, 44+6, 60*ScaleX, 32*ScaleX);
        [cancel addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cancel];
        
    }
    return self;
}

- (void)clearBtnClick
{
    _searchField.text = @"";
    _searchField.placeholder = @"请输入商品名称";
}

- (void)cancelBtnClick
{
    if (self.clickedCancelBlock) {
        self.clickedCancelBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
