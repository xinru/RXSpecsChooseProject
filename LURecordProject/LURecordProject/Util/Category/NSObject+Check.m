//
//  NSObject+objectAtIndex.m
//
//  Copyright © 2016年 Mo. All rights reserved.
//

#import "NSObject+Check.h"

@interface NSObject ()
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@end
const void *dateFormatterKey = "dateFormatterKey";
@implementation NSObject (Check)
// 防止数组 objectAtIndex越界引信崩溃的保护方法
- (id)objectAtIndexCheck:(NSUInteger)index {
    if ([self isKindOfClass:[NSArray class]] || [self isKindOfClass:[NSMutableArray class]]) {
        if (index >= [(NSArray *)self count]) {
            return nil;
        }
        id value = [(NSArray *)self objectAtIndex:index];
        if (value == [NSNull null]) {
            return nil;
        }
        return value;
    } else {
        return nil;
    }
}

- (BOOL)isEqualToStringCheck:(NSString *)string {
    if ([self isKindOfClass:[NSString class]] || [self isKindOfClass:[NSMutableString class]] || [self respondsToSelector:@selector(isEqualToString:)]) {
        return [(NSString *)self isEqualToString:string];
    } else {
        NSLog(@"isEqualToStringCheck调用者不是NSString");
        return NO;
    }
}

- (id)substringToIndexCheck:(NSUInteger)index {
    if ([self isKindOfClass:[NSString class]] || [self isKindOfClass:[NSMutableString class]] || [self respondsToSelector:@selector(substringToIndex:)]) {
        if (index > [(NSString *)self length]) {
            return nil;
        }
        id value = [(NSString *)self substringToIndex:index];
        if (value == [NSNull null]) {
            return nil;
        }
        return value;
    } else {
        return nil;
    }
}

- (id)subdataWithRangeCheck:(NSRange)range {
    if ([self isKindOfClass:[NSData class]] || [self respondsToSelector:@selector(subdataWithRange:)]) {
        if (range.location + range.length > [(NSData *)self length]) {
            return nil;
        }
        id value = [(NSData *)self subdataWithRange:range];
        if (value == [NSNull null]) {
            return nil;
        }
        return value;
    } else {
        return nil;
    }
}

- (void)setDateFormatter:(NSDateFormatter *)dateFormatter {
    objc_setAssociatedObject(self, dateFormatterKey, dateFormatter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDateFormatter *)dateFormatter {
    return objc_getAssociatedObject(self, dateFormatterKey);
}

- (NSString *)dealWithTimeStringWithString:(NSString *)timeString {
    // 日期格式化类
    if (!self.dateFormatter) {
        self.dateFormatter = [[NSDateFormatter alloc] init];
    }
    // 设置日期格式 为了转换成功
    NSString *str =  [timeString substringToIndexCheck:18];
    self.dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    self.dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    NSDate *timeDate = [self.dateFormatter dateFromString:str];
    if (timeDate == nil) {
        return nil;
    }
    //创建当前日历对象
    NSCalendar *calender = [NSCalendar currentCalendar];
    //是否是今天
    if ([calender isDateInToday:timeDate]) {
        self.dateFormatter.dateFormat = @"HH:mm:ss";
    }else if ([calender isDateInYesterday:timeDate]) {
        self.dateFormatter.dateFormat = @"yyyy-MM-dd";
    }else {
        self.dateFormatter.dateFormat = @"yyyy-MM-dd";
    }
    NSString *result = [self.dateFormatter stringFromDate:timeDate];
    return result;
}

@end
