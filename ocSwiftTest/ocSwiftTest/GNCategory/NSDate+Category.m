//
//  NSDate+Category.m
//  WJ
//
//  Created by mac on 14-8-6.
//  Copyright (c) 2014年 ecan. All rights reserved.
//

#import "NSDate+Category.h"

@implementation NSDate(Category)

- (NSString *) toStringWithFormatter:(NSString *)fmt
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:fmt];
    return [formatter stringFromDate:self];
}

+ (NSDate *) dateWithJavaDate: (NSNumber *) minseconds
{
    return [NSDate dateWithTimeIntervalSince1970:minseconds.doubleValue/1000];
}

+ (NSDate *) dateWithString: (NSString *)dateString{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    return [formatter dateFromString:dateString];
}


//当前这个月有几天
- (NSInteger) dayCountInMonth{
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSRange range = [cal rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}

//第一个星期的星期一在当月第几号
-(NSInteger)firstWeekDayInMonth {
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setFirstWeekday:2]; //星期一是第一天
    NSDateComponents *comps = [gregorian components:NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay fromDate:self];
    [comps setDay:1];
    NSDate *newDate = [gregorian dateFromComponents:comps];
    return [gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekday forDate:newDate];
}

//月份滚动:-1上月,+1下月
-(NSDate *)offsetMonth:(int)tmp {
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setFirstWeekday:1]; //星期一是第一天
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setMonth:tmp];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}

//号滚动:-1前一天,+1后一天
-(NSDate *)offsetDay:(int)tmp{
    NSCalendar *gregorian = [NSCalendar currentCalendar];
    [gregorian setFirstWeekday:1]; //星期一是第一天
    
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setDay:tmp];
    return [gregorian dateByAddingComponents:offsetComponents toDate:self options:0];
}
//根据date返回string
//+ (NSString *)dateFromString:(NSDate *)date withFormat:(NSString *)format {
//    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
//    [inputFormatter setDateFormat:format];
//    NSString *dateStr = [inputFormatter stringFromDate:date];
//    return dateStr;
//}
@end
