//
//  MHViewDefine.h
//  PerfectProject
//
//  Created by Andy on 14/12/3.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#ifndef PerfectProject_MHViewDefine_h
#define PerfectProject_MHViewDefine_h

/**
 *	获取视图宽度
 *
 *	@param 	view 	视图对象
 *
 *	@return	宽度
 */
#define DEF_WIDTH(view) view.bounds.size.width

/**
 *	获取视图高度
 *
 *	@param 	view 	视图对象
 *
 *	@return	高度
 */
#define DEF_HEIGHT(view) view.bounds.size.height

/**
 *	获取视图原点横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点横坐标
 */
#define DEF_LEFT(view) view.frame.origin.x

/**
 *	获取视图原点纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	原点纵坐标
 */
#define DEF_TOP(view) view.frame.origin.y

/**
 *	获取视图右下角横坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角横坐标
 */
#define DEF_RIGHT(view) (DEF_LEFT(view) + DEF_WIDTH(view))

/**
 *	获取视图右下角纵坐标
 *
 *	@param 	view 	视图对象
 *
 *	@return	右下角纵坐标
 */
#define DEF_BOTTOM(view) (DEF_TOP(view) + DEF_HEIGHT(view))

/**
 *  主屏的宽
 */
#define DEF_SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width


/**
 *  侧边栏被遮挡的大小  屏幕宽度为320时
 */
#define DEF_SIDER_WIDTH_320  107


/**
 *  侧边栏被遮挡的大小  屏幕宽度除320以外
 */
#define DEF_SIDER_WIDTH_OTHER  134


/**
 *  主屏的高
 */
#define DEF_SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define DEF_VIEW_HEIGHT self.view.size.height

/**
 *  主屏的size
 */
#define DEF_SCREEN_SIZE   [[UIScreen mainScreen] bounds].size

/**
 *  主屏的frame
 */
#define DEF_SCREEN_FRAME  [UIScreen mainScreen].applicationFrame

/**
 *	生成RGB颜色
 *
 *	@param 	red 	red值（0~255）
 *	@param 	green 	green值（0~255）
 *	@param 	blue 	blue值（0~255）
 *
 *	@return	UIColor对象
 */
#define DEF_RGB_COLOR(_red, _green, _blue) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:1]

/**
 *	生成RGBA颜色
 *
 *	@param 	red 	red值（0~255）
 *	@param 	green 	green值（0~255）
 *	@param 	blue 	blue值（0~255）
 *	@param 	alpha 	blue值（0~1）
 *
 *	@return	UIColor对象
 */
#define DEF_RGBA_COLOR(_red, _green, _blue, _alpha) [UIColor colorWithRed:(_red)/255.0f green:(_green)/255.0f blue:(_blue)/255.0f alpha:(_alpha)]


/**
 *	生成二进制颜色
 *
 *	@param 	hex 	颜色描述字符串，带“0x”开头
 *
 *	@return	UIColor对象
 */
#define DEF_HEX_COLOR(hex)          [UIColor colorWithRGBHex:hex alpha:1]


/**
 *	生成二进制颜色
 *
 *	@param 	hex 	颜色描述字符串，带“0x”开头
 *  @param 	_alpha 	透明度
 *
 *	@return	UIColor对象
 */
#define DEF_HEXA_COLOR(hex, _alpha) [UIColor colorWithRGBHex:hex alpha:_alpha]

/**
 *  判断屏幕尺寸是否为640*1136 5s,5
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)


/**
 *  判断屏幕尺寸是否为640*1136 5s,5
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)


/**
 *  判断屏幕尺寸是否为750*1334  6
 *
 *	@return	判断结果（YES:是 NO:不是）
 */
#define DEF_SCREEN_IS_6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *  判断屏幕尺寸是否为1080*1920 6plus
 *
 *	@return	判断结果（YES:是 NO:不是）
 */

#define DEF_SCREEN_IS_6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

#define HscalNum (mainWidth/375)

#endif
