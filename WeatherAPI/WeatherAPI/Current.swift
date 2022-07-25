//
//  Current.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 04.07.2022.
//

import Foundation

// MARK: - Current
struct Current: Codable {
    
    let dt,pressure, humidity, clouds, visibility, windDeg: Int
    let sunrise, sunset: Int
    let temp: Double
    let feelsLike:Double
    let dewPoint: Double
    let uvi: Double
    let windSpeed:Double
    let windGust: Double?
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case pressure
        case humidity
        case uvi
        case clouds
        case visibility
        case weather
        case sunrise, sunset
        case feelsLike = "feels_like"
        case dewPoint = "dew_point"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
    }
}
