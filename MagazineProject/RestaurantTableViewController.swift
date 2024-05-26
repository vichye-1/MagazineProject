//
//  RestaurantTableViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController {
    
    @IBOutlet var backgroundView: UIView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    let list = RestaurantList().restaurantArray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchViewUI()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantCell", for: indexPath) as! RestaurantTableViewCell
        let data = list[indexPath.row]
        
        // image
        let urlString = data.image
        let url = URL(string: urlString)
        
        cell.restaurantImage.kf.setImage(with: url)
        cell.restaurantImage.contentMode = .scaleToFill
        cell.restaurantImage.layer.cornerRadius = 4
        
        // index label
        let idx = indexPath.row
        
        cell.indexLabel.backgroundColor = .orange
        cell.indexLabel.layer.cornerRadius = 20
        cell.indexLabel.text = String(indexPath.row + 1)
        cell.indexLabel.textAlignment = .center
        cell.indexLabel.textColor = .white
        cell.indexLabel.font = .boldSystemFont(ofSize: 17)
        
        // category, address(일부)
        let typeOfFood = data.category
        let addressSegment = data.address.components(separatedBy: " ")
        
        cell.locationInfoLabel.text = "\(typeOfFood) · \(addressSegment[1])"
        cell.locationInfoLabel.textAlignment = .left
        cell.locationInfoLabel.textColor = .lightGray
        cell.locationInfoLabel.font = .systemFont(ofSize: 13)
        
        
        
        
        return cell
    }
    
    
    private func searchViewUI() {
        backgroundView.backgroundColor = .lightGray.withAlphaComponent(0.2)
        backgroundView.layer.cornerRadius = 10
        
        searchTextField.borderStyle = .none
        searchTextField.backgroundColor = .clear
        searchTextField.placeholder = "가고싶은 음식점명 또는 지역을 입력해주세요"
        
        searchButton.backgroundColor = .lightGray.withAlphaComponent(0.4)
        searchButton.layer.cornerRadius = 7
        searchButton.setTitle("검색", for: .normal)
        searchButton.setTitleColor(.black, for: .normal)
        searchButton.setTitleColor(.gray, for: .highlighted)
    }
    
}
