//
//  Data.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 06.07.2022.
//

import Foundation

// MARK: - Date
extension Date {
    
    // MARK: - Custom method
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        return dateFormatter.string(from: self)
    }

    func timeOfTheDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self)
    }
    
    func timeOfSunsetAndSunrise() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: self)
    }
}
