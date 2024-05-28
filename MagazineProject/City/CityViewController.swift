//
//  CityViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit
import Kingfisher
import Cosmos

class CityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var cityTableView: UITableView!
    
    var list = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTableView.rowHeight = 180
        // cityTableView.rowHeight = UITableView.automaticDimension
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        let xib = UINib(nibName: "CityTableViewCell", bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: "CityTableViewCell")
        
        let adXib = UINib(nibName: "AdTableViewCell", bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: "AdTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return list[indexPath.row].ad ? 120 : 160
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = list[indexPath.row]
        
        if !data.ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell", for: indexPath) as! CityTableViewCell
            cell.configureCell(data: data)
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = .white
            cell.likeButton.tag = indexPath.row
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdTableViewCell", for: indexPath) as! AdTableViewCell
        cell.configureCell(data: data)
        return cell
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        list[sender.tag].like?.toggle()
        cityTableView.reloadRows(at: [IndexPath(row: sender.tag,section: 0)], with: .automatic) // 깜빡거림
        //cityTableView.reloadData() - 안 깜빡거림
    }
}
