//
//  RestaurantTableViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/26/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewController: UITableViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    var list = RestaurantList().restaurantArray
    var filteredList: [Restaurant] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cheap = UIBarButtonItem(title: "만원 이하", style: .plain, target: self, action: #selector(cheapButtonClicked))
        let korean = UIBarButtonItem(title: "한식", style: .plain, target: self, action: #selector(koreanButtonClicked))
        let all = UIBarButtonItem(title: "전체보기", style: .plain, target: self, action: #selector(allButtonClicked))
    }
    
    @objc func cheapButtonClicked() {
        
    }
    
    @objc func koreanButtonClicked() {
        
    }
    
    @objc func allButtonClicked() {
        filteredList = list
        
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
        
        // 음식점명
        let name = data.name
        
        cell.nameLabel.text = name
        cell.nameLabel.font = .boldSystemFont(ofSize: 15)
        cell.nameLabel.numberOfLines = 0
        
        // 가격대
        let price = data.price
        
        cell.priceLabel.text = "\(price.formatted()) 원대"
        cell.priceLabel.font = .systemFont(ofSize: 13)
        cell.priceLabel.textColor = .lightGray
        
        // 저장 버튼
        let bookmark = data.like ? "bookmark.fill" : "bookmark"
        let image = UIImage(systemName: bookmark)
        
        cell.saveButton.tag = indexPath.row
        cell.saveButton.setImage(image, for: .normal)
        cell.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        cell.saveButton.backgroundColor = .lightGray
        cell.saveButton.layer.cornerRadius = cell.saveButton.layer.frame.size.width / 2
        cell.saveButton.tintColor = .white
        
        return cell
    }
    
    @objc fileprivate func saveButtonClicked(sender: UIButton) {
        list[sender.tag].like.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .automatic)
    }
        
    private func alertError() {
        let alert = UIAlertController(title: "검색 결과가 없습니다", message: "다른 음식점을 찾아보세요", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
}
