//
//  Formatters.swift
//  Talkies
//
//  Created by santhoshkumar nampally on 23/03/20.
//  Copyright © 2020 santhoshkumar nampally. All rights reserved.
//

import Foundation

enum FormatType: String {
    case HHMMSS = "HH:mm:SS"
    case HHMM = "HH:mm"
    case hhmma = "HH:mm a"
    case YYYYMMDDTHHmmSS = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case hhmmaEEEMMMdd = "hh:mm a EEE,MMM dd"
    case ddMMMMYYYYmmSS = "dd MMMM yyyy hh:mm a"
    case ddMMMYYYYmmSS = "dd MMM yyyy hh:mm a"
    case ddMMMMYYYY = "dd MMMM yyyy"
    case YYYYMMDD = "yyyy-MM-dd"
    case hhmmaddMMYYYY = "hh:mm a, dd-MM-yyyy"
    case DDMMYYYY = "dd-MM-yyyy"
}

class Formatters {
    static let shared: Formatters = Formatters()
    
    private let dateFormater = DateFormatter()
    
    func timeDifferenceInDDHHMMSS(_ date:Date) -> (Int,Int,Int,Int) {
        let timeDifference = Int(date.timeIntervalSince(Date()))
        return ((timeDifference/86400),((timeDifference % 86400)/3600), (timeDifference % 3600) / 60, (timeDifference % 3600) % 60)
    }
    
    func getDateFromString(_ dateStr:String, type: FormatType) -> Date? {
        dateFormater.dateFormat = type.rawValue
        return dateFormater.date(from: dateStr)
    }
    
    func getTimeDiffFromNow(_ dateStr:String, type: FormatType) -> TimeInterval? {
        dateFormater.dateFormat = type.rawValue
        return dateFormater.date(from: dateStr)?.timeIntervalSinceNow
    }
    
    func getTheTransformedString(_ dataStr:String, dateFormatType:FormatType, requiredFormatType:FormatType) -> String {
        dateFormater.dateFormat = dateFormatType.rawValue
        
        if let date = dateFormater.date(from: dataStr){
            dateFormater.dateFormat = requiredFormatType.rawValue
            return dateFormater.string(from: date)
        }
        
        return ""
    }
    
    func getStringFromDate(_ date:Date?, dateFormatType:FormatType, requiredFormatType:FormatType) -> String
    {
        dateFormater.dateFormat = dateFormatType.rawValue
        
        if let date = date {
            let dateStr = dateFormater.string(from: date)
            dateFormater.dateFormat = requiredFormatType.rawValue
            return getTheTransformedString(dateStr, dateFormatType: dateFormatType, requiredFormatType: requiredFormatType)
        }
        
        return ""
    }
}
