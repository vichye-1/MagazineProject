//
//  TravelTableViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/25/24.
//

import UIKit

struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    var date: String
    let link: String
}


class TravelTableViewController: UITableViewController {
    
    let list = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "magazineCell", for: indexPath) as! TravelTableViewCell
        
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.font = .boldSystemFont(ofSize: 25)
        
        return cell
    }

}
