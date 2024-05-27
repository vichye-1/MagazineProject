//
//  CityViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityTableView: UITableView!
    
    var list = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityTableView.rowHeight = 200
        cityTableView.delegate = self
        cityTableView.dataSource = self
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.titleLabel.font = .boldSystemFont(ofSize: 17)
        
        cell.descriptionLabel.text = data.description
        cell.descriptionLabel.font = .systemFont(ofSize: 15)
        cell.descriptionLabel.textColor = .lightGray
        
        cell.etcLabel.text = "별점"
        cell.etcLabel.textColor = .lightGray.withAlphaComponent(0.5)
        cell.etcLabel.font = .systemFont(ofSize: 13)
        
        let url = URL(string: data.travel_image ?? "")
        cell.cityImage.kf.setImage(with: url, placeholder: UIImage(systemName: "heart"))
        cell.cityImage.contentMode = .scaleAspectFill
        cell.cityImage.layer.cornerRadius = 15
        
        return cell
    }
    

        


}
