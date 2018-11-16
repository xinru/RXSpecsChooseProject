//
//  NSObject+objectAtIndex.h
//
//  Copyright © 2016年 Mo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (objectAtIndexChect)
// 防止数组 objectAtIndex越界引信崩溃的保护方法
- (id)objectAtIndexCheck:(NSUInteger)index;
//防止调用者不是string
- (BOOL)isEqualToStringCheck:(NSString *)string;
// 防止截取字符串越界
- (id)substringToIndexCheck:(NSUInteger)index;
// 防止截取NSData越界
- (id)subdataWithRangeCheck:(NSRange)range;

//处理时间字符串
- (NSString *)dealWithTimeStringWithString:(NSString *)timeString;
@end
