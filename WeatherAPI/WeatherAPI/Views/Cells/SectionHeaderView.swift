//
//  DailySectionHeaderViewView.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 07.07.2022.
//

import UIKit

// MARK: - DailySectionHeaderView
final class SectionHeaderView: UICollectionReusableView {
    
    // MARK: - Outlet
    @IBOutlet private var headerLabel: UILabel!
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        headerLabel.textColor = UIColor(white: 1, alpha: 0.3)
    }

    // MARK: - Public method
    func configuration(select: HeaderSection) {
        switch select {
        case .hourlyHeader:
            headerLabel.text = Constants.Header.hourlyForcast
        case .dailyHeader:
            headerLabel.text = Constants.Header.tenDayForcast
        }
    }
}
