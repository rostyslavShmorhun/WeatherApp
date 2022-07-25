//
//  WeatherViewPresenter.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 27.06.2022.
//

import Foundation

// MARK: - WeatherPresenterProtocol
protocol WeatherPresenterProtocol {
    var model: WeatherModel? { get set }
    var collectionView: CollectionViewProtocol? { get set }
    
    func getLocation(longitude: Double, latitude: Double)
}

// MARK: - WeatherPresenter
final class WeatherViewPresenter {
    
    // MARK: - Private properties
    private weak var view: WeatherViewProtocol?
    
    // MARK: - Public properties
    weak var collectionView: CollectionViewProtocol?
    var model: WeatherModel?
    
    // MARK: - Life cycle
    init (view: WeatherViewProtocol) {
        self.view = view
    }
}

// MARK: - WeatherPresenterProtocol
extension WeatherViewPresenter: WeatherPresenterProtocol {
        
    func getLocation(longitude: Double, latitude: Double) {
        WeatherService.shered.network.getWeatherByCoordinates(longitude: longitude, latitude: latitude)
            .done { [weak self] response in
                Log.info(response)
                guard let self = self else { return }
                self.model = response
                self.collectionView?.reloadData()
            }.catch { error in
                Log.error(error.localizedDescription)
            }
    }
    
    func updateData(model: WeatherModel) {
        self.model = model
    }
}
