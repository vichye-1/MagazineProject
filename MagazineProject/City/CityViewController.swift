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
        
        let xib = UINib(nibName: CityTableViewCell.cityIdentifier, bundle: nil)
        cityTableView.register(xib, forCellReuseIdentifier: CityTableViewCell.cityIdentifier)
        
        let adXib = UINib(nibName: AdTableViewCell.adIdentifier, bundle: nil)
        cityTableView.register(adXib, forCellReuseIdentifier: AdTableViewCell.adIdentifier)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.cityIdentifier, for: indexPath) as! CityTableViewCell
            cell.configureCell(data: data)
            
            cell.likeButton.tag = indexPath.row
            cell.likeButton.tintColor = .white
            cell.likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
            
            return cell
        }
        let cell = cityTableView.dequeueReusableCell(withIdentifier: AdTableViewCell.adIdentifier, for: indexPath) as! AdTableViewCell
        cell.configureCell(data: data)
        return cell
    }
    
    @objc func likeButtonTapped(_ sender: UIButton) {
        list[sender.tag].like?.toggle()
        cityTableView.reloadRows(at: [IndexPath(row: sender.tag,section: 0)], with: .automatic) // 깜빡거림
        //cityTableView.reloadData() - 안 깜빡거림
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = list[indexPath.row]
        
        if data.ad {
            let adStoryBoard = UIStoryboard(name: "CitySpecificStoryboard", bundle: nil)
            let adViewController = adStoryBoard.instantiateViewController(withIdentifier: "AdSpecificViewController") as! AdSpecificViewController
            let nav = UINavigationController(rootViewController: adViewController)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        } else {
            let cityStoryBoard = UIStoryboard(name: "CitySpecificStoryboard", bundle: nil)
            let cityViewController = cityStoryBoard.instantiateViewController(withIdentifier: "CitySpecificViewController") as! CitySpecificViewController
            cityViewController.passData = data
            navigationController?.pushViewController(cityViewController, animated: true)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
