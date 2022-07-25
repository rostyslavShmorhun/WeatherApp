//
//  DetailsCollectionReusableView.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 15.07.2022.
//

import UIKit
import Moya

// MARK: - DetailsCollectionReusableView
final class DetailsCollectionReusableView: UICollectionReusableView {

    // MARK: - Outlet
    @IBOutlet private var spaceConstrait: NSLayoutConstraint!
    @IBOutlet private var secondVisualEffectView: UIVisualEffectView!
    @IBOutlet private var firstVisualEffectView: UIVisualEffectView!
    @IBOutlet private var firstHeader: UILabel!
    @IBOutlet private var secondHeader: UILabel!
    @IBOutlet private var firstIcon: UIImageView!
    @IBOutlet private var secondIcon: UIImageView!
    
    // MARK: - Properties
    let redius: Double = 8.0
    let colorClear = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    
    // MARK: - Life cycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    // MARK: - Custom method
    func configuration(select: DetailHeader){
        switch select {
        case .uvIndexAndSunset:
            configurationOutlet(imageFirst: UIImage(named: "􀆮"), imageSecond: UIImage(named: "􀆲"), firstHeaderText: Constants.Header.uvIndex, secondHeaderText: Constants.Header.sunset)
        case .fielsLikeAndHumidity:
            configurationOutlet(imageFirst: UIImage(named: "􀇬"), imageSecond: UIImage(named: "􁃚"), firstHeaderText: Constants.Header.feelsLike, secondHeaderText: Constants.Header.humidity)
        case .visibilityAndWind:
            configurationOutlet(imageFirst: UIImage(named: "􀇬"), imageSecond: UIImage(named: "􀇤"), firstHeaderText: Constants.Header.visibility, secondHeaderText: Constants.Header.wind)
        }
    }
    
    func setup(){
        firstVisualEffectView.backgroundColor = colorClear
        secondVisualEffectView.backgroundColor = colorClear
        firstIcon.tintColor = .white
        secondIcon.tintColor = .white
        firstVisualEffectView.roundCorners(corners: [.topLeft, .topRight], radius: redius)
        secondVisualEffectView.roundCorners(corners: [.topLeft, .topRight], radius: redius)
        spaceConstrait.constant = 10
        self.layoutIfNeeded()
    }
    
    func configurationOutlet(imageFirst: UIImage!, imageSecond: UIImage!, firstHeaderText: String, secondHeaderText: String){
        firstIcon.image = imageFirst.withRenderingMode(.alwaysTemplate)
        secondIcon.image = imageSecond.withRenderingMode(.alwaysTemplate)
        firstHeader.text = firstHeaderText
        secondHeader.text = secondHeaderText
    }
}
