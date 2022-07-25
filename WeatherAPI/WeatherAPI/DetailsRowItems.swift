//
//  DetailsRowItems.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 19.07.2022.
//

import Foundation

// MARK: - DetailsRowItems
enum DetailsRowItems: Int {
    case firstRow
    case secondRow
    
    var value: Int{
        switch self {
        case .firstRow:
            return 0
        case .secondRow:
            return 1
        }
    }
}
