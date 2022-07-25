//
//  WetherHourlyCollectionViewCell.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 29.06.2022.
//

import UIKit

//MARK: - WeatherHourlyCollectionViewCell
final class WeatherHourlyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    @IBOutlet private var weatherIconImageView: UIImageView!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var temperatureLabel: UILabel!
    @IBOutlet private var humidityLabel: UILabel!
    
    // MARK: - Properties
    let rainCode = Array(500...531)
    
    // MARK: - Custom Methods
    func configureHourly(model: WeatherModel?, indexPath: IndexPath){
        guard let model = model else {return}
        let hourlyByRow = model.hourly[indexPath.row]
        temperatureLabel.text = "\(Int(hourlyByRow.temp))° "
        weatherIconImageView.image = UIImage(named: "\(hourlyByRow.weather[0].icon)")
        timeLabel.text = DateHelper.equalDate(swichDay: .now, firstDate: hourlyByRow.dt, secondDate: model.hourly[0].dt)
        if hourlyByRow.pop >= 0.1 && rainCode.contains(hourlyByRow.weather[0].id) {
            humidityLabel.text = "\(Int(hourlyByRow.pop * 100))\(Constants.String.percentage)"
        } else {
            humidityLabel.text = " "
        }
    }
}
