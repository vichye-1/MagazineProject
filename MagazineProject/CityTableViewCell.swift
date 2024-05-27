//
//  CityTableViewCell.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit
import Kingfisher
import Cosmos

class CityTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starLabel: CosmosView!
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }
    
    func configureLayout() {
        titleLabel.titleLabelUI()
        descriptionLabel.descriptionLabelUI()
    }

    func configureCell(data: Travel) {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        
        let saveStr = data.save?.formatted()
        
        starLabel.text = "\(data.grade ?? 0) · 저장 \(saveStr ?? "0")"
        
        if let url = data.travel_image {
            let imageURL = URL(string: url)
            cityImage.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "heart"))
            cityImage.contentMode = .scaleAspectFill
        } else {
            cityImage.image = UIImage(systemName: "timer")
        }
        
        starLabel.rating = data.grade ?? 0
        starLabel.settings.updateOnTouch = false
        starLabel.settings.fillMode = .precise
        starLabel.settings.starSize = 15
        starLabel.settings.starMargin = 1
        starLabel.settings.filledColor = UIColor.systemYellow
        starLabel.settings.emptyBorderColor = UIColor.systemYellow
        starLabel.settings.filledBorderColor = UIColor.systemYellow
        
                
        
        /**
         let bookmark = data.like ? "bookmark.fill" : "bookmark"
         let image = UIImage(systemName: bookmark)
         
         cell.saveButton.tag = indexPath.row
         cell.saveButton.setImage(image, for: .normal)
         cell.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
         cell.saveButton.backgroundColor = .lightGray
         cell.saveButton.layer.cornerRadius = cell.saveButton.layer.frame.size.width / 2
         cell.saveButton.tintColor = .white

         */
    }
    
}
