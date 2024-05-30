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
        
        navigationItem.title = "식당 추천"
        
        let map = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(mapButtonClicked))
        
        filteredList = list
        
        foodTableView.rowHeight = 180
        foodTableView.delegate = self
        foodTableView.dataSource = self
        
        let foodXib = UINib(nibName: RestaurantTableViewCell.restaurantIdentifier, bundle: nil)
        foodTableView.register(foodXib, forCellReuseIdentifier: RestaurantTableViewCell.restaurantIdentifier)
        
        filterButtons()
    }
    
    @objc
    func mapButtonClicked() {
        let vc = storyboard?.instantiateViewController(withIdentifier: "RestaurantMapViewController") as! RestaurantMapViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = filteredList[indexPath.row]
        
        let cell = foodTableView.dequeueReusableCell(withIdentifier: RestaurantTableViewCell.restaurantIdentifier, for: indexPath) as! RestaurantTableViewCell
        cell.configureRestaurantCell(data: data)
        
        let index = indexPath.row
        cell.indexLabel.text = "\(index + 1)"
        
        cell.bookmarkButton.tag = indexPath.row
        cell.bookmarkButton.addTarget(self, action: #selector(bookmarkButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc
    func bookmarkButtonClicked(_ sender: UIButton) {
        filteredList[sender.tag].like.toggle()
        foodTableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
    
    func filterButtons() {
        cheapButton.setTitle("만원 이하", for: .normal)
        cheapButton.filterButtonUI()
        
        koreanButton.setTitle("한식", for: .normal)
        koreanButton.filterButtonUI()
        
        cafeButton.setTitle("카페", for: .normal)
        cafeButton.filterButtonUI()
        
        allButton.setTitle("전체 선택", for: .normal)
        allButton.filterButtonUI()
        
        cheapButton.addTarget(self, action: #selector(cheapButtonClicked), for: .touchUpInside)
        koreanButton.addTarget(self, action: #selector(koreanButtonClicked), for: .touchUpInside)
        cafeButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        allButton.addTarget(self, action: #selector(allButtonClicked), for: .touchUpInside)

    }
    
    @objc 
    func cheapButtonClicked() {
        var cheapFood: [Restaurant] = []
        
        for item in list {
            if item.price <= 10000 {
                cheapFood.append(item)
            }
        }
        filteredList = cheapFood
        foodTableView.reloadData()
    }
    
    @objc 
    func koreanButtonClicked() {
        var koreanFood: [Restaurant] = []
        
        for item in list {
            if item.category == "한식" {
                koreanFood.append(item)
            }
        }
        filteredList = koreanFood
        foodTableView.reloadData()
    }
    
    @objc 
    func cafeButtonClicked() {
        var cafeList: [Restaurant] = []
        
        for item in list {
            if item.category == "카페" {
                cafeList.append(item)
            }
        }
        filteredList = cafeList
        foodTableView.reloadData()
    }
    
    @objc 
    func allButtonClicked() {
        filteredList = list
        foodTableView.reloadData()
    }
}
