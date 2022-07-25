//
//  EnvironmentInterceptor.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 23.06.2022.
//

import Foundation
import Alamofire

struct EnvironmentInterceptor: RequestInterceptor {

    func adapt(_ urlRequest: URLRequest,
               for session: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print("🚀 Running request: \(urlRequest.httpMethod ?? "") - \(urlRequest.url?.absoluteString ?? "")")

        return completion(.success(urlRequest))
    }
}
