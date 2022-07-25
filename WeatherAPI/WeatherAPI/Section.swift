//
//  Section.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 29.06.2022.
//

import Foundation

// MARK: - Section
enum Section: Int, CaseIterable {
    case mainHeader
    case hourly
    case daily
    case detailsFirsr
    case detailsSecond
    case detailsThird
    
    var numberOfRows: Int {
        switch self {
        case .mainHeader:
            return 1
        case .detailsFirsr,
                .detailsSecond,
                .detailsThird:
            return 2
        default:
            return 0
        }
    }
}

