//
//  WeatherNetwork.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 23.06.2022.
//

import Foundation
import Moya
import PromiseKit

//MARK: - Final classe
final class WeatherNetwork: Networkable {

    //MARK: - Properties
    let provider: MoyaProvider<WeatherProvider>
    let dataConverter: JSONDataConverterService
    
    init(converter: JSONDataConverterService,
         plugins: [PluginType],
         interceptor: EnvironmentInterceptor = EnvironmentInterceptor()) {
        self.dataConverter = converter
        let session = Session(startRequestsImmediately: false, interceptor: interceptor)
        let provider = MoyaProvider<WeatherProvider>(session: session, plugins: plugins)
        self.provider = provider
    }
    
    // MARK: - Methods
    func getWeatherByCoordinates(longitude: Double, latitude: Double) -> Promise<WeatherModel> {
        return executeAndMap(request: .getWeatherByCoordinates(longitude: longitude, latitude: latitude))
    }
}
