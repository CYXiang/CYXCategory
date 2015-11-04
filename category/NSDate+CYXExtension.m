//
//  NSDate+CYXExtension.m
//  CYXBuDeJie
//
//  Created by Macx on 15/10/17.
//  Copyright © 2015年 CYX. All rights reserved.
//

#import "NSDate+CYXExtension.h"

@implementation NSDate (CYXExtension)

/**
 *  是否为今天
 */
- (BOOL)isToday
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    return selfCmps.year == nowCmps.year
    && selfCmps.month == nowCmps.month
    && selfCmps.day == nowCmps.day;
    
    //    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //    fmt.dateFormat = @"yyyy-MM-dd";
    //
    //    NSString *selfYear = [fmt stringFromDate:self];
    //    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
    //
    //    return [selfYear isEqualToString:nowYear];
}

/**
 *  是否为昨天
 */
- (BOOL)isYesterday
{
    // 2015-04-01 10:10:10 -> 2015-04-10 00:00:00
    // 2015-03-31 23:50:40 -> 2015-03-31 00:00:00
    
    // 生成只有年月日的日期对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == 1;
}

/**
 *  是否为明天
 */
- (BOOL)isTomorrow
{
    // 生成只有年月日的日期对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *selfString = [fmt stringFromDate:self];
    NSDate *selfDate = [fmt dateFromString:selfString];
    
    NSString *nowString = [fmt stringFromDate:[NSDate date]];
    NSDate *nowDate = [fmt dateFromString:nowString];
    
    // 比较差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *cmps = [calendar components:unit fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.year == 0
    && cmps.month == 0
    && cmps.day == -1;
}

/**
 *  是否为今年
 */
- (BOOL)isThisYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger selfYear = [calendar component:NSCalendarUnitYear fromDate:self];
    NSInteger nowYear = [calendar component:NSCalendarUnitYear fromDate:[NSDate date]];
    return selfYear == nowYear;
    //    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    //    fmt.dateFormat = @"yyyy";
    //
    //    NSString *selfYear = [fmt stringFromDate:self];
    //    NSString *nowYear = [fmt stringFromDate:[NSDate date]];
    //
    //    return [selfYear isEqualToString:nowYear];
}

@end
