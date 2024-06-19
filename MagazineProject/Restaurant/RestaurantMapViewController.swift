//
//  RestaurantMapViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/31/24.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {

    @IBOutlet var restaurantMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantMapView.delegate = self
    }
    
}

extension RestaurantMapViewController: MKMapViewDelegate {
    
}
