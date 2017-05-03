//
//  NSDate+Category.h
//  WJ
//
//  Created by mac on 14-8-6.
//  Copyright (c) 2014年 ecan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate(Category)

- (NSString *) toStringWithFormatter:(NSString *)fmt;

+ (NSDate *) dateWithJavaDate: (NSNumber *) minseconds;

//将yyyy-MM-dd格式的字符串转成NSDate类型
+ (NSDate *) dateWithString: (NSString *)dateString;

//当前这个月有几天
- (NSInteger) dayCountInMonth;

//第一个星期的星期一在当月第几号
-(NSInteger)firstWeekDayInMonth;

//月份滚动:-1上月,+1下月
-(NSDate *)offsetMonth:(int)tmp;

//号滚动:-1前一天,+1后一天
- (NSDate *)offsetDay:(int)tmp;

//+ (NSString *)dateFromString:(NSDate *)date withFormat:(NSString *)format;

@end
