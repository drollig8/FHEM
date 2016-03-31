//
//  Extension+String.swift
//  iKVB
//
//  Created by Marc Felden on 21.03.16.
//  Copyright © 2016 Timm Kent. All rights reserved.
//

import Foundation

extension String {
    func toDateWithDayMonthYear() -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yy"
        return formatter.dateFromString(self)
    }
    
    func toDateFromHourMinuteString() -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.dateFromString(self)
    }
    
    func toDateWithDayMonthYearWithTime() -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd.MM.yy HH:mm"
        return formatter.dateFromString(self)
    }
    
    func getStringBetweenStrings(string1:String?,string2:String?) -> String? {

        let restString = ""
        let string3 = self

        if let string1 = string1, string2 = string2 {
            if let foundStringRange = string3.rangeOfString(string1) {
                let restString2 = string3[foundStringRange.endIndex.advancedBy(0)...string3.endIndex.advancedBy(-1)]
                if let foundStringRange2 = restString2.rangeOfString(string2) {
                    let endIndex = foundStringRange2.startIndex.advancedBy(-1)
                    return restString2[restString.startIndex...endIndex]
                }
            }
        }
        if string1 == nil {
            if let string2 = string2 {
                let restString2 = string3
                if let foundStringRange2 = restString2.rangeOfString(string2) {
                    let endIndex = foundStringRange2.startIndex.advancedBy(-1)
                    return restString2[restString.startIndex...endIndex]
                }
            }
        }
        
        if string2 == nil {
            if let string1 = string1 {
                if let foundStringRange = string3.rangeOfString(string1) {
                    let restString2 = string3[foundStringRange.endIndex.advancedBy(0)...string3.endIndex.advancedBy(-1)]
                    return restString2
                }
            }
        }
        return nil
    }
    func toDouble() -> Double?
    {
        let newString = self.stringByReplacingOccurrencesOfString(".", withString: ",")
        return NSNumberFormatter().numberFromString(newString)?.doubleValue
    }
    
    func toFloat() -> Float?
    {
        let newString = self.stringByReplacingOccurrencesOfString(".", withString: ",")
        return NSNumberFormatter().numberFromString(newString)?.floatValue
    }
    
    func toInt() -> Int?
    {
        let intValue = Int(self)
        return intValue
    }
}
