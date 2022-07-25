//
//  NibRepresentable.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 29.06.2022.
//

import Foundation
import UIKit

// MARK: - NibRepresentable
protocol NibRepresentable {
    static var nib: UINib { get }
    static var identifier: String { get }
}
