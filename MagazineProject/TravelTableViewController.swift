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
        
        // kingfisher 라이브러리 사용해서 url상의 image 가져오기
        let data = list[indexPath.row]
        let urlString = data.photo_image
        let url = URL(string: urlString)
        
        // dateforamtter 이용해서 string -> yy년 MM월 dd일 형식으로 변환
        let date = data.date
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyMMdd"
        
        let convertDate = myFormatter.date(from: date)
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yy년 MM월 dd일"
        let convertStr = dateformatter.string(from: convertDate!)
        
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
        
        cell.dateLabel.text = convertStr
        cell.dateLabel.textAlignment = .right
        cell.dateLabel.textColor = .lightGray
        cell.dateLabel.font = .boldSystemFont(ofSize: 15)
        
        return cell
    }
}
