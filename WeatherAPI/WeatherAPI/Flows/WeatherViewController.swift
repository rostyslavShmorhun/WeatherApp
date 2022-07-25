//
//  WeatherViewController.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 27.06.2022.
//

import UIKit
import CoreLocation

// MARK: - WeatherViewProtocol
protocol WeatherViewProtocol: AnyObject {
    func reloadData(model: WeatherModel)
}

// MARK: - WeatherViewController
final class WeatherViewController: UIViewController {
    
    // MARK: - Properties
    lazy var locationManager = LocationManager(viewControler: self)
    var presenter: WeatherPresenterProtocol!
    
    // MARK: - Outlet
    @IBOutlet var barView: UIView!
    
    // MARK: - Action
    @IBAction func searchButtonDidTap(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchTableViewController") as? SearchTableViewController else { return }
        vc.presenter = PresenterSearchTableViewController(tableView: vc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Download-Free-Weather-Background.jpg")!)
        locationManager.delegate = self
        locationManager.requestLocation()
        navigationController?.isNavigationBarHidden = true
        barView.backgroundColor = UIColor(white: 0.4, alpha: 0.3)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? CollectionViewController {
            controller.presenter = self.presenter
            self.presenter.collectionView = controller
        }
    }
}

// MARK: - WeatherViewProtocol
extension WeatherViewController: WeatherViewProtocol {
    func reloadData(model: WeatherModel){
    }
}

//MARK: - LocationManagerDelegate
extension WeatherViewController: LocationManagerDelegate {
    func coordinationUpdate(location: CLLocationCoordinate2D) {
        presenter.getLocation(longitude: location.longitude, latitude: location.latitude)
    }
}
