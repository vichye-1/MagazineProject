//
//  RestaurantMapViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/31/24.
//

import UIKit
import CoreLocation
import MapKit

final class RestaurantMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var restaurantMapView: MKMapView!
    let restaurantList = RestaurantList()
    let locationManager = CLLocationManager()
    let defaultCenter = CLLocationCoordinate2D(latitude: 37.517742, longitude: 126.886463)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restaurantMapView.delegate = self
        locationManager.delegate = self
    }
    
    private func addRestaurants() {
        for restaurant in restaurantList.restaurantArray {
            let annotation = MKPointAnnotation()
            annotation.title = restaurant.name
            annotation.subtitle = restaurant.address
            annotation.coordinate = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
            restaurantMapView.addAnnotation(annotation)
        }
    }
    
    private func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 500, longitudinalMeters: 500)
        restaurantMapView.setRegion(region, animated: true)
        addRestaurants()
    }
}

extension RestaurantMapViewController {
    private func checkDeviceLocationAuthorization() {
        if CLLocationManager.locationServicesEnabled() {
            checkCurrentLocationAuthorization()
        } else {
            setRegionAndAnnotation(center: defaultCenter)
        }
    }
    
    private func checkCurrentLocationAuthorization() {
        var status: CLAuthorizationStatus
        
        if #available(iOS 14.0, *) {
            status = locationManager.authorizationStatus
        } else {
            status = CLLocationManager.authorizationStatus()
        }
        switch status {
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
        case .denied:
            goToSettingAlert()
            setRegionAndAnnotation(center: defaultCenter)
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        default:
            print(status)
        }
    }
    
    private func goToSettingAlert() {
            let alert = UIAlertController(title: "위치 권한을 거부하셨습니다", message: "이 앱을 사용하려면 위치 접근 권한을 설정해야합니다. 설정으로 이동하시겠습니까?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "확인", style: .default) { _ in
                if let url = URL(string: UIApplication.openSettingsURLString) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            let no = UIAlertAction(title: "취소", style: .destructive, handler: nil)
            alert.addAction(yes)
            alert.addAction(no)
            present(alert, animated: true, completion: nil)
        }
}

extension RestaurantMapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            setRegionAndAnnotation(center: coordinate)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        setRegionAndAnnotation(center: defaultCenter)
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkDeviceLocationAuthorization()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(#function)
    }
}
