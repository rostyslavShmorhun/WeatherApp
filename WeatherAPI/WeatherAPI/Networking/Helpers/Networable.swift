//
//  Networable.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 23.06.2022.
//

import Foundation
import PromiseKit
import Moya


typealias TemplatePromise<T> = Promise<T>

protocol Networkable {
    // swiftlint:disable type_name
    associatedtype T: TargetType
    // swiftlint:enable type_name
    var provider: MoyaProvider<T> { get }
    var dataConverter: JSONDataConverterService { get }
}

extension Networkable {

    func execute(request: T) -> Promise<Data> {
        let promise = TemplatePromise<Data>.pending()

        self.provider.request(request) { result in
            switch result {
            case .success(let moyaResponse):
                promise.resolver.fulfill(moyaResponse.data)
            case .failure(let error):
                promise.resolver.reject(error)
            }
        }
        return promise.promise
    }

    func executeAndMap<U: Decodable>(request: T) -> Promise<U> {
        return execute(request: request).compactMap(dataConverter.getParser())
    }
}

