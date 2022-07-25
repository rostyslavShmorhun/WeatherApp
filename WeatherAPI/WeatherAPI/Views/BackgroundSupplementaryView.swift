//
//  BackgroundSupplementaryView.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 07.07.2022.
//

import UIKit

// MARK: - BackgroundSupplementaryView
final class BackgroundSupplementaryView: UICollectionReusableView {
    
    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addBlurEffect()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private method
    private func addBlurEffect() {
        layer.cornerRadius = 10
        layer.masksToBounds = true
        self.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        let darkBlur = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = self.bounds
        blurView.translatesAutoresizingMaskIntoConstraints = false
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurView)
    }
}
