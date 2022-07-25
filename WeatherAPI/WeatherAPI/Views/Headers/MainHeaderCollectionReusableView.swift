//
//  MainHeaderCollectionReusableView.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 13.07.2022.
//

import UIKit

// MARK: - MainHeaderCollectionReusableView
final class MainHeaderCollectionReusableView: UICollectionReusableView {
    
    // MARK: - Outlets
    @IBOutlet private var nameCityLabel: UILabel!
    @IBOutlet private var tempLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var highAndLowTemp: UILabel!
    
    // MARK: - Custom method
    func configuration(model: WeatherModel?) {
        guard let model = model else {return}
        nameCityLabel.text = model.timezone.replacingOccurrences(of: "[/_]",with: " ", options: .regularExpression, range: nil)
        tempLabel.text = "\(Int(model.current.temp))° "
        descriptionLabel.text = model.current.weather[0].description
        highAndLowTemp.text = "H:\(Int(model.daily[0].temp.max)) L:\(Int(model.daily[0].temp.min))"
    }
}
