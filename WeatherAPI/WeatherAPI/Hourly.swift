//
//  Hourly.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 05.07.2022.
//

import Foundation

// MARK: - Hourly
struct Hourly: Codable {
    
    let dt, pressure, humidity: Int
    let clouds, visibility, windDeg: Int
    let sunrise, sunset: Int?
    let temp, feelsLike, uvi, dewPoint: Double
    let windSpeed, windGust, pop: Double
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset, temp, weather
        case feelsLike = "feels_like"
        case pressure, humidity, pop
        case dewPoint = "dew_point"
        case uvi, clouds, visibility
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
    }
}
