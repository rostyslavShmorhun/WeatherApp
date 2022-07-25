//
//  Weather.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 04.07.2022.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
        let id: Int
        let main, description, icon: String
}
