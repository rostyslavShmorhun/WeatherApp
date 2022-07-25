//
//  equalDate.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 14.07.2022.
//

import Foundation

// MARK: - DateHelper
final class DateHelper {
     
    // MARK: - Public method
    static func equalDate(swichDay: Day ,firstDate: Int, secondDate: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(firstDate))
        let secondDate = Date(timeIntervalSince1970: TimeInterval(secondDate))
        switch swichDay {
        case .now:
            return date == secondDate ? Constants.DayIndex.now : date.timeOfTheDay()
        case .today:
            return date == secondDate ? Constants.DayIndex.today : date.dayOfTheWeek()
        }
    }
}
