//
//  WeatherDailyCollectionViewCell.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 30.06.2022.
//

import UIKit
import Foundation
import Alamofire

// MARK: - WeatherDailyCollectionViewCell
final class WeatherDailyCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlet
    @IBOutlet private var dayLabel: UILabel!
    @IBOutlet private var maxTempLabel: UILabel!
    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var minTepmLabel: UILabel!
    @IBOutlet private var popLabel: UILabel!
    
    // MARK: - Properties
    let rainCode = Array(500...531)
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.minTepmLabel.textColor = UIColor(white: 1, alpha: 0.25)
    }
    
    // MARK: - Custom Methods
    func configureDaily(model: WeatherModel?, indexPath: IndexPath){
        guard let model = model else {return}
        let dailyByRow = model.daily[indexPath.row]
        maxTempLabel.text = "\(Int(dailyByRow.temp.max))°"
        minTepmLabel.text = "\(Int(dailyByRow.temp.min))°"
        iconImageView.image = UIImage(named: "\(dailyByRow.weather[0].icon)")
        dayLabel.text = DateHelper.equalDate(swichDay: .today, firstDate: dailyByRow.dt, secondDate: model.daily[0].dt)
        
        if dailyByRow.pop >= 0.1 && rainCode.contains(dailyByRow.weather[0].id) {
            popLabel.text = "\(Int(dailyByRow.pop * 100))\(Constants.String.percentage)"
        } else {
            popLabel.isHidden = true
        }
    }
}
