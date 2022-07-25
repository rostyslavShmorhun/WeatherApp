//
//  UVIndex.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 19.07.2022.
//

import Foundation

// MARK: - UVIndex
enum UVIndex: Double {
    case minimal
    case low
    case moderate
    case higt
    case veryHigt
    
     var curentUvi: ClosedRange<Double> {
        switch self {
        case .minimal:
            return 0...2
        case .low:
            return 3...4
        case .moderate:
            return 5...6
        case .higt:
            return 7...9
        case .veryHigt:
            return 10...20
        }
    }
}
