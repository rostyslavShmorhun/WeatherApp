//
//  Temp.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 04.07.2022.
//

import Foundation

// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

