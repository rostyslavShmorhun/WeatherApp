//
//  CityModel.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 20.07.2022.
//

import Foundation

// MARK: - CityModel
struct CityModel: Codable {
    let id: Int
    let name, state, country: String
    let coord: Coord
}
