//
//  RestaurantMapViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/31/24.
//

import UIKit
import CoreLocation
import MapKit

final class RestaurantMapViewController: UIViewController {

    @IBOutlet var restaurantMapView: MKMapView!
    let restaurantList = RestaurantList()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRestaurants()
        configureMapView()
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
    
    private func configureMapView() {
        var zoomRect = MKMapRect.null
        
        for restaurant in restaurantList.restaurantArray {
            let annotationPoint = MKMapPoint(CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude))
            let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 0.1, height: 0.1)
            zoomRect = zoomRect.union(pointRect)
        }
        restaurantMapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50), animated: true)
    }
}

extension RestaurantMapViewController: MKMapViewDelegate {
    
}

extension RestaurantMapViewController: CLLocationManagerDelegate {
    
}
