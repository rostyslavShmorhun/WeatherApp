//
//  WeatherService.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 23.06.2022.
//

import Foundation
import Moya

//MARK: - Struct
struct WeatherService {
    
    //MARK: - Static Properties
    static let shered = WeatherService()
    
    //MARK: - Properties
    let network: WeatherNetwork
    
    private init() {
        let config = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        let loggerPlugin = NetworkLoggerPlugin(configuration: config)
        let converter = JSONDataConverterService()
        
        network = WeatherNetwork(converter: converter,
                                     plugins: [loggerPlugin],
                                     interceptor: EnvironmentInterceptor())
    }
}
