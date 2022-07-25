//
//  UICollectionViewExtension.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 29.06.2022.
//

import Foundation
import UIKit

// MARK: - UICollectionView
extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as! T
    }

    func registerCell<T: UICollectionViewCell>( _ type: T.Type) {
        self.register(type.nib, forCellWithReuseIdentifier: type.identifier)
    }
    
    func registerHeader<T: UICollectionReusableView>( _ type: T.Type) {
        self.register(type.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier)
    }
    
    func dequeueSupplementaryView<T: UICollectionReusableView>(_ type: T.Type, ofKind: String, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: type.identifier, for: indexPath) as! T
    }
    
    func dequeueHeader<T: UICollectionReusableView>(_ type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableSupplementaryView(
          ofKind: UICollectionView.elementKindSectionHeader,
          withReuseIdentifier: type.identifier,
          for: indexPath) as! T
      }
}
