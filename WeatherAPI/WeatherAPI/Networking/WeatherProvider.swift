//
//  WeatherEndPoint.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 22.06.2022.
//

import Foundation
import Moya

//MARK: - Enumerations
enum WeatherProvider {
    case getWeatherByCoordinates(longitude: Double, latitude: Double)
}

//MARK: - Extension
extension WeatherProvider: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?appid=\(Constants.Weather.apiKey)&units=metric") else { fatalError("baseURL could not be configured")}
        return url
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .getWeatherByCoordinates(longitude, latitude):
            let parameters: [String: Any] = [
                "lon" : longitude,
                "lat" : latitude,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        let parameters: [String: String] = [:]
        return parameters
    }
}
