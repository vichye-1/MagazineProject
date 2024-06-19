//
//  RestaurantMapViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/31/24.
//

import UIKit
import MapKit

final class RestaurantMapViewController: UIViewController {

    @IBOutlet var restaurantMapView: MKMapView!
    let restaurantList = RestaurantList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantMapView.delegate = self
        addRestaurants()
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
    
}

extension RestaurantMapViewController: MKMapViewDelegate {
    
}
