//
//  PresenterSearchTableViewController.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 20.07.2022.
//

import Foundation

// MARK: - SearchPresenterProtocol
protocol SearchPresenterProtocol{
    var model: CityModel? { get set }
    func getData()
}

// MARK: - PresenterSearchTableViewController
final class PresenterSearchTableViewController{
    
    // MARK: - Private Properties
    private weak var tableView: SearchTableViewProtocol?
    var model: CityModel?
    
    // MARK: - Life Cycle
    init(tableView: SearchTableViewProtocol) {
        self.tableView = tableView
    }
}

// MARK: - PresenterSearchTableViewController
extension PresenterSearchTableViewController: SearchPresenterProtocol{
    func getData(){
        func raedJson(fileName: String) -> Data? {
            do {
                if let filePath = Bundle.main.path(forResource: fileName, ofType: "json") {
                    let fileURL = URL(fileURLWithPath: filePath)
                    let data = try Data(contentsOf: fileURL)
                    return data
                }
            } catch {
                Log.error(error)
            }
            return nil
        }
        
        func parse(data: Data) -> CityModel? {
            do {
                let decodeData = try JSONDecoder().decode(CityModel.self, from: data)
                return decodeData
            } catch {
                Log.error(error)
            }
            return nil
        }
        
        func loadJson() {
            let loadData = raedJson(fileName: "city_list")
            guard let loadData = loadData else { return }
            if let recordObject = parse(data: loadData) {
                model = recordObject
            }
        }
    }
}
