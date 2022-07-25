//
//  DailySectionHeaderViewView.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 07.07.2022.
//

import UIKit

// MARK: - DailySectionHeaderView
final class DailySectionHeaderView: UICollectionReusableView {
    
    // MARK: - Outlet
    @IBOutlet var headerLabel: UILabel!

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(blurView, at: 0)
    }
}
