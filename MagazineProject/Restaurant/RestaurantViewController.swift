//
//  RestaurantViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/28/24.
//

import UIKit

class RestaurantViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var foodTableView: UITableView!
    
    @IBOutlet var cheapButton: UIButton!
    @IBOutlet var koreanButton: UIButton!
    @IBOutlet var cafeButton: UIButton!
    @IBOutlet var allButton: UIButton!
    
    var list = RestaurantList().restaurantArray
    var filteredList: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodTableView.rowHeight = 180
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        let foodXib = UINib(nibName: RestaurantTableViewCell.restaurantIdentifier, bundle: nil)
        foodTableView.register(foodXib, forCellReuseIdentifier: RestaurantTableViewCell.restaurantIdentifier)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        
        let cell = foodTableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.restaurantIdentifier, for: indexPath) as! RestaurantTableViewCell
        cell.configureRestaurantCell(data: data)
        return cell
    }
}
