//
//  TravelTableViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/25/24.
//

import UIKit
import Kingfisher

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
        let urlString = data.photo_image
        let url = URL(string: urlString)
        
        let dateString = data.date
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyMMdd"
        guard let finalDate = myFormatter.date(from: dateString) else {
            cell.dateLabel.text = ""
            return cell
        }
        
        let dateOutterFormat = DateFormatter()
        dateOutterFormat.dateFormat = "yy년 MM월 dd일"
        let finalDateString = dateOutterFormat.string(from: finalDate)
        cell.dateLabel.text = finalDateString
                        
        cell.MagazineImageView.kf.setImage(with: url)
        cell.MagazineImageView.contentMode = .scaleToFill
        cell.MagazineImageView.layer.cornerRadius = 15
        
        cell.titleLabel.text = data.title
        cell.titleLabel.textColor = .darkGray
        cell.titleLabel.numberOfLines = 0
        cell.titleLabel.textAlignment = .left
        cell.titleLabel.font = .boldSystemFont(ofSize: 25)
        
        cell.subtitleLabel.text = data.subtitle
        cell.subtitleLabel.textColor = .lightGray
        cell.subtitleLabel.numberOfLines = 0
        cell.subtitleLabel.font = .boldSystemFont(ofSize: 17)
        cell.subtitleLabel.textAlignment = .left
        
        cell.dateLabel.text = data.date
        cell.dateLabel.textAlignment = .right
        
        return cell
    }
    
    
}
