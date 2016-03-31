//
//  Extension+NSDate.swift
//  KVBnow
//
//  Created by Marc Felden on 27.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation
extension NSDate {
    func toDayMonthYear() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter.stringFromDate(self)
    }
    
    func toMonthYear() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM.yy"
        return formatter.stringFromDate(self)
    }
    
    func toDayMonth() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM"
        return formatter.stringFromDate(self)
    }
    
    func getDayFromDate(date:NSDate) -> String {
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let myComponents = myCalendar.components(.Weekday, fromDate: self)
        let weekDay = myComponents.weekday
        var dayDay = ""
        switch weekDay {
        case 0: dayDay = "Sa"
        case 1: dayDay = "So"
        case 2: dayDay = "Mo"
        case 3: dayDay = "Di"
        case 4: dayDay = "Mi"
        case 5: dayDay = "Do"
        case 6: dayDay = "Fr"
        case 7: dayDay = "Sa"
        default: dayDay = "XX"
        }
        return dayDay
    }
    
    func getDayFromDateLong(date:NSDate) -> String {
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let myComponents = myCalendar.components(.Weekday, fromDate: self)
        let weekDay = myComponents.weekday
        var dayDay = ""
        switch weekDay {
        case 0: dayDay = "Samstag"
        case 1: dayDay = "Sonntag"
        case 2: dayDay = "Montag"
        case 3: dayDay = "Dienstag"
        case 4: dayDay = "Mittwoch"
        case 5: dayDay = "Donnerstag"
        case 6: dayDay = "Freitag"
        case 7: dayDay = "Samstag"
        default: dayDay = "XX"
        }
        return dayDay
    }
    
    // get Mo., 15.09.2015 from NSDate
    func toDayWithLeadingZero() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd"
        return formatter.stringFromDate(self)
    }
    
    func toMonthThreeCiphers() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.stringFromDate(self)
    }
    
    // get Mo., 15.09.2015 from NSDate
    func toDayDayMonthYear() -> String {
        
        let dayDay = getDayFromDate(self)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return dayDay + "., "+formatter.stringFromDate(self)
    }
    
    // get Mo., 15.09.2015 16:15 from NSDate
    func toDayDayMonthYearHourMinuteSecond() -> String {
        let dayDay = getDayFromDate(self)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm:ss"
        return dayDay + "., "+formatter.stringFromDate(self)
    }
    
    func toHourMinuteSecond() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        return formatter.stringFromDate(self)
    }
    func toHourMinute() -> String {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.stringFromDate(self)
    }
    
}
