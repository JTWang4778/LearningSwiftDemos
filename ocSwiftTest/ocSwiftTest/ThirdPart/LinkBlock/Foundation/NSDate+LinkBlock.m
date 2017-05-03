//
//  NSDate+LinkBlock.m
//  LinkBlockProgram
//
//  Created by NOVO on 15/9/3.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "LinkBlock.h"

@implementation NSObject(NSDateLinkBlock)
- (NSInteger (^)(NSDate *))dateMinusYear
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusYear,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitYear
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps year];
    };
}
- (void)setDateMinusYear:(NSInteger (^)(NSDate *))dateMinusYear{};

- (NSInteger (^)(NSDate *))dateMinusMonth
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusMonth,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMonth
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps month];
    };
}
- (void)setDateMinusMonth:(NSInteger (^)(NSDate *))dateMinusMonth{};

- (NSInteger (^)(NSDate *))dateMinusDay
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusDay,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitDay
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps day];
    };
}
- (void)setDateMinusDay:(NSInteger (^)(NSDate *))dateMinusDay{};

- (NSInteger (^)(NSDate *))dateMinusHour
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusHour,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitHour
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps hour];
    };
}
- (void)setDateMinusHour:(NSInteger (^)(NSDate *))dateMinusHour{};

- (NSInteger (^)(NSDate *))dateMinusMinut
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusMinut,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitMinute
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps minute];
    };
}
- (void)setDateMinusMinut:(NSInteger (^)(NSDate *))dateMinusMinut{};

- (NSInteger (^)(NSDate *))dateMinusSec
{
    return ^(NSDate* date){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinusSec,date)
        NSDateComponents* comps = [[NSCalendar currentCalendar]
                                   components:NSCalendarUnitSecond
                                   fromDate:_self toDate:date
                                   options:0];
        return [comps second];
    };
}
- (void)setDateMinusSec:(NSInteger (^)(NSDate *))dateMinusSec{};

- (NSString *(^)(NSString *))dateToStrWithFormat
{
    return ^id(NSString* formatStr){
        LinkHandle_REF(NSString, NSDate)
        LinkGroupHandle_REF(dateToStrWithFormat,formatStr)
        if(!formatStr || ![formatStr isKindOfClass:[NSString class]])
            return [_self description];
        NSDateFormatter* fmt=  [NSDateFormatter new];
        fmt.dateFormat= formatStr;
        return [fmt stringFromDate:_self];
    };
}
- (void)setDateToStrWithFormat:(NSString *(^)(NSString *))dateToStrWithFormat{};

- (NSDate *(^)(NSTimeInterval))dateAddTimeInterval
{
    return ^id(NSTimeInterval timeInterval){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddTimeInterval,timeInterval)
        return [_self dateByAddingTimeInterval:timeInterval];
    };
}
- (void)setDateAddTimeInterval:(NSDate *(^)(NSTimeInterval))dateAddTimeInterval{};

- (NSDate *(^)(NSInteger))dateAddSec
{
    return ^id(NSInteger sec){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddSec,sec)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.second=sec;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddSec:(NSDate *(^)(NSInteger))dateAddSec{};

- (NSDate *(^)(NSInteger))dateAddMinut
{
    return ^id(NSInteger minute){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddMinut,minute)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.minute=minute;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddMinut:(NSDate *(^)(NSInteger))dateAddMinut{};

- (NSDate *(^)(NSInteger))dateAddHour
{
    return ^id(NSInteger hour){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddHour,hour)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.hour=hour;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddHour:(NSDate *(^)(NSInteger))dateAddHour{};

- (NSDate *(^)(NSInteger))dateAddDay
{
    return ^id(NSInteger day){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddDay,day)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.day=day;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddDay:(NSDate *(^)(NSInteger))dateAddDay{};

- (NSDate *(^)(NSInteger))dateAddMonth
{
    return ^id(NSInteger month){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddMonth,month)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.month=month;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddMonth:(NSDate *(^)(NSInteger))dateAddMonth{};

- (NSDate *(^)(NSInteger))dateAddYear
{
    return ^id(NSInteger year){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateAddYear,year)
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        comps.year=year;
        NSCalendar *calender = [NSCalendar currentCalendar];
        return [calender dateByAddingComponents:comps toDate:_self options:0];
    };
}
- (void)setDateAddYear:(NSDate *(^)(NSInteger))dateAddYear{};

- (NSInteger (^)())dateYear
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateYear)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit fromDate:_self];
        return [comps year];
    };
}
- (void)setDateYear:(NSInteger (^)())dateYear{};

- (NSInteger (^)())dateMonth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMonth)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMonthCalendarUnit fromDate:_self];
        return [comps month];
    };
}
- (void)setDateMonth:(NSInteger (^)())dateMonth{};
- (NSInteger (^)())dateDay
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateDay)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSDayCalendarUnit fromDate:_self];
        return [comps day];
    };
}
- (void)setDateDay:(NSInteger (^)())dateDay{};
- (NSInteger (^)())dateHour
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateHour)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSHourCalendarUnit fromDate:_self];
        return [comps hour];
    };
}
- (void)setDateHour:(NSInteger (^)())dateHour{};
- (NSInteger (^)())dateMinut
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateMinut)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSMinuteCalendarUnit fromDate:_self];
        return [comps minute];
    };
}
- (void)setDateMinut:(NSInteger (^)())dateMinut{};
- (NSInteger (^)())dateSec
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSInteger)0;
        }
        LinkGroupHandle_VAL(dateSec)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSSecondCalendarUnit fromDate:_self];
        return [comps second];
    };
}
- (void)setDateSec:(NSInteger (^)())dateSec{};

- (NSDate *(^)())dateDayAtStart
{
    return ^id(){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateDayAtStart)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=0;
        comps.minute=0;
        comps.second=0;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}
- (void)setDateDayAtStart:(NSDate *(^)())dateDayAtStart{};

- (NSDate *(^)())dateDayAtEnd
{
    return ^id(){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateDayAtEnd)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSUIntegerMax fromDate:_self];
        comps.hour=23;
        comps.minute=59;
        comps.second=59;
        return [[NSCalendar currentCalendar] dateFromComponents:comps];
    };
}
- (void)setDateDayAtEnd:(NSDate *(^)())dateDayAtEnd{};

- (NSDate *(^)())dateCurrentZone
{
    return ^id(){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateCurrentZone)
        NSTimeZone* zone = [NSTimeZone systemTimeZone];
        NSInteger offset = [zone secondsFromGMTForDate:_self];
        return [_self dateByAddingTimeInterval:offset];
    };
}
- (void)setDateCurrentZone:(NSDate *(^)())dateCurrentZone{};

- (NSDate *(^)(NSInteger))dateSetYear
{
    return ^id(NSInteger year){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetYear,year)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitYear fromDate:_self];
        comps.year=year;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetYear:(NSDate *(^)(NSInteger))dateSetYear{};

- (NSDate *(^)(NSInteger))dateSetMonth
{
    return ^id(NSInteger month){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetMonth,month)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitMonth fromDate:_self];
        comps.month=month;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetMonth:(NSDate *(^)(NSInteger))dateSetMonth{};

- (NSDate *(^)(NSInteger))dateSetDay
{
    return ^id(NSInteger day){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetDay,day)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitDay fromDate:_self];
        comps.day=day;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetDay:(NSDate *(^)(NSInteger))dateSetDay{};

- (NSDate *(^)(NSInteger))dateSetHour
{
    return ^id(NSInteger hour){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetHour,hour)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.hour=hour;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetHour:(NSDate *(^)(NSInteger))dateSetHour{};

- (NSDate *(^)(NSInteger))dateSetMinut
{
    return ^id(NSInteger minute){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetMinut,minute)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.minute=minute;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetMinut:(NSDate *(^)(NSInteger))dateSetMinut{};

- (NSDate *(^)(NSInteger))dateSetSec
{
    return ^id(NSInteger sec){
        LinkHandle_REF(NSDate, NSDate)
        LinkGroupHandle_REF(dateSetSec,sec)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        calendar.timeZone=[NSTimeZone systemTimeZone];
        NSDateComponents *comps  = [calendar components:NSCalendarUnitHour fromDate:_self];
        comps.second=sec;
        NSTimeInterval timeNum = (double)(int)[[calendar dateFromComponents:comps] timeIntervalSince1970];
        return [NSDate dateWithTimeIntervalSince1970:timeNum];
    };
}
- (void)setDateSetSec:(NSDate *(^)(NSInteger))dateSetSec{};

- (BOOL (^)())dateIsLeapYear
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsLeapYear)
        NSInteger year = _self.dateYear();
        if ((year%4==0 && year %100 !=0) || year%400==0) {
            return YES;
        }else {
            return NO;
        }
        return NO;
    };
}
- (void)setDateIsLeapYear:(BOOL (^)())dateIsLeapYear{};

- (BOOL (^)())dateIsInToday
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsInToday)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month] && [comps day]==[compsNow day]){
            return YES;
        }
        return NO;
    };
}
- (void)setDateIsInToday:(BOOL (^)())dateIsInToday{};

- (BOOL (^)())dateIsInMonth
{
    return ^(){
        LinkHandle_VAL_IFNOT(NSDate){
            return NO;
        }
        LinkGroupHandle_VAL(dateIsInMonth)
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSDateComponents *comps  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:_self];
        NSDateComponents *compsNow  = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit fromDate:[NSDate date]];
        if([comps year]==[compsNow year] && [comps month]==[compsNow month]){
            return YES;
        }
        return NO;
    };
}
- (void)setDateIsInMonth:(BOOL (^)())dateIsInMonth{};

- (NSTimeInterval (^)())dateTimeIntervalSince1970
{
    return ^(){
        
        LinkHandle_VAL_IFNOT(NSDate){
            return (NSTimeInterval)0.0;
        }
        LinkGroupHandle_VAL(dateTimeIntervalSince1970)
        return [_self timeIntervalSince1970];
    };
}
- (void)setDateTimeIntervalSince1970:(NSTimeInterval (^)())dateTimeIntervalSince1970{};

- (NSDateComponents *(^)())dateComponentsAll
{
    return ^id(){
        LinkHandle_REF(NSDateComponents, NSDate)
        LinkGroupHandle_REF(dateComponentsAll)
        return [[NSCalendar currentCalendar] components:NSUIntegerMax fromDate:_self];
    };
}
- (void)setDateComponentsAll:(NSDateComponents *(^)())dateComponentsAll{};
@end
