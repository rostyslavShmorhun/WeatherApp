//
//  LocationMenager.swift
//  WeatherAPI
//
//  Created by Rostyslav Shmorhun on 23.06.2022.
//

import Foundation
import CoreLocation
import UIKit

// MARK: - LocationManagerDelegate
protocol LocationManagerDelegate: AnyObject {
    func coordinationUpdate(location: CLLocationCoordinate2D)
}

// MARK: - LocationManager
class LocationManager: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Private Properties
    private var viewControler: UIViewController
    private let locationManager = CLLocationManager()
    weak var delegate: LocationManagerDelegate?

    // MARK: - Life cycle
    init(viewControler: UIViewController) {
        self.viewControler = viewControler
        super.init()
        locationManager.delegate = self
    }
    
    //MARK: - Methods
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        locationManager.stopMonitoringSignificantLocationChanges()
        delegate?.coordinationUpdate(location: location.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied || status == .restricted {
            showAlert()
        }
        print("location manager authorization status changed")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: "TITLE", message: "Please go to Settings and turn on the permissions", preferredStyle: .alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(cancelAction)
        alertController.addAction(settingsAction)
        self.viewControler.present(alertController, animated: true, completion: nil)
    }
}

