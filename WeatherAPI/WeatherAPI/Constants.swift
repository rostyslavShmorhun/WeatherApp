//
//  Constants.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 22.06.2022.
//

import Foundation

// MARK: - Constants
struct Constants {
    
    // MARK: - Weather
    struct Weather {
        
        // MARK: - Static properties
        static let apiKey = "0f158f76db5b186912f2139b8612082c"
    }
    
    // MARK: - String
    struct String {
        
        // MARK: - Static properties
        static let percentage = "%"
        static let celsius = "°"
    }
    
    // MARK: - Header
    struct Header {
        static let hourlyForcast = "HOURLY FORCAST"
        static let tenDayForcast = "10-DAY FORCAST"
        static let uvIndex = "UV INDEX"
        static let sunset = "SUNSET"
        static let feelsLike = "FEELS LIKE"
        static let humidity = "HUMIDITY"
        static let wind = "WIND"
        static let visibility = "VISIBILITY"
    }
    
    // MARK: - UVIndex
    struct UVIndex {
        static let minimalState = "Minimal"
        static let minimalDescription = "Wear sunglasses on bright day"
        static let lowlState = "Low"
        static let lowlDescription = "Wear sunglasses on bright day"
        static let moderateState = "Moderate"
        static let moderateDescription = "Stay in shade near midday"
        static let higtlState = "Higt"
        static let higtDescription = "Cuver up, wear a hat and sunglasses, and use sunscreen"
        static let veryHigtState = "Very Higt"
        static let veryHigtDescription = "Wear sunglasses on bright day"
    }
    
    //MARK: - DayIndex
    struct DayIndex {
        static let now = "Now"
        static let today = "Today"
    }
}
