//
//  HeaderSection.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 15.07.2022.
//

import Foundation

// MARK: - HeaderSection
enum HeaderSection {
    case hourlyHeader
    case dailyHeader
}

enum DetailHeader {
    case uvIndexAndSunset
    case fielsLikeAndHumidity
    case visibilityAndWind
}
