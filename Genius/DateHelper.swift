//
//  DateHelper.swift
//  Genius
//
//  Created by Nguyễn Tùng on 09/07/2022.
//

import Foundation

func formatDate(time: Int) -> String{
    let date = Date(timeIntervalSince1970: TimeInterval(time))
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = "yyyy-MM-dd" //Specify your format that you want
    return dateFormatter.string(from: date)
    
}
