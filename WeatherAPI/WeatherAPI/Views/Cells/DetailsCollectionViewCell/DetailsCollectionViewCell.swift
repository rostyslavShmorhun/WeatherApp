//
//  DetailsCollectionViewCell.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 14.07.2022.
//

import UIKit

// MARK: - DetailsCollectionViewCell
final class DetailsCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet private var valueLabel: UILabel!
    @IBOutlet private var stateLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    
    // MARK: - Lice cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.frame
        self.backgroundView = blurEffectView
    }
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.bottomRight, .bottomLeft], radius: 8)
    }
    
    // MARK: - Custom method
    func configuration(select: DetailsSection, model: WeatherModel?, indexPach: IndexPath) {
        guard let model = model else {return}
        let dateSunset = Date(timeIntervalSince1970: TimeInterval(model.current.sunset))
        let dataSunriset = Date(timeIntervalSince1970: TimeInterval(model.current.sunrise))
        switch select {
        case .uvIndexAndSunset:
            switch DetailsRowItems(rawValue: indexPach.row) {
            case .firstRow:
                valueLabel.text = "\(Int(model.current.uvi))"
                guard let model = UVIndex(rawValue: model.current.uvi) else {break}
                switch model {
                case .minimal:
                    configurationUvIndex(state:  Constants.UVIndex.minimalState, description: Constants.UVIndex.minimalDescription)
                case .low:
                    configurationUvIndex(state: Constants.UVIndex.lowlState, description: Constants.UVIndex.lowlDescription)
                case .moderate:
                    configurationUvIndex(state: Constants.UVIndex.moderateState, description: Constants.UVIndex.moderateDescription)
                case .higt:
                    configurationUvIndex(state: Constants.UVIndex.higtlState, description: Constants.UVIndex.higtDescription)
                case .veryHigt:
                    configurationUvIndex(state: Constants.UVIndex.veryHigtState, description: Constants.UVIndex.veryHigtDescription)
                }
            case .secondRow:
                valueLabel.text = "\(dateSunset.timeOfSunsetAndSunrise())"
                descriptionLabel.text = "Sunriset: \(dataSunriset.timeOfSunsetAndSunrise())"
                stateLabel.isHidden = true
            default:
                Log.error("Error with data")
            }
        case .fielsLikeAndHumidity:
            stateLabel.isHidden = true
            descriptionLabel.isHidden = true
            switch DetailsRowItems(rawValue: indexPach.row) {
            case .firstRow:
                valueLabel.text = "\(Int(model.current.feelsLike))\(Constants.String.celsius)"
            case .secondRow:
                valueLabel.text = "\(Int(model.current.humidity))\(Constants.String.percentage)"
            default:
                Log.error("Error with data")
            }
        case .visibilityAndWind:
            switch DetailsRowItems(rawValue: indexPach.row) {
            case .firstRow:
                valueLabel.text = "\(model.current.visibility / 100) km"
                stateLabel.isHidden = true
                descriptionLabel.isHidden = true
            case .secondRow:
                valueLabel.text = "\(Int(model.current.windSpeed)) m/s"
                stateLabel.text = "Wind gust: \(Int(model.current.windGust ?? 0))m/s"
                stateLabel.font = .systemFont(ofSize: 18)
                descriptionLabel.text = "Wind direction: \(Int(model.current.windGust ?? 0))\n "
            default:
                Log.error("Error with data")
            }
        }
    }
    
    func configurationUvIndex(state: String, description: String) {
        stateLabel.text = state
        descriptionLabel.text = description
    }
}
