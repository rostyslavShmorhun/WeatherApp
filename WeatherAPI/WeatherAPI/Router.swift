//
//  Router.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 27.06.2022.
//

import Foundation
import UIKit

// MARK: - Router
final class Router {
    
    // MARK: - Public functions
    func startApp(window: UIWindow?) {
      showWeather(window: window)
    }
    
    // MARK: - Private functions
      private func showWeather(window: UIWindow?) {
          guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherViewController") as? WeatherViewController else { return }
        vc.presenter =  WeatherViewPresenter(view: vc)
        let navigationViewController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationViewController
      }
}
