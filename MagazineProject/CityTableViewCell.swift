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
        likeButton.tintColor = .white
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
            cityImage.layer.cornerRadius = 15
        } else {
            cityImage.image = UIImage(systemName: "timer")
        }
        
        let heart = data.like ?? false ? "heart.fill" : "heart"
        let heartImage = UIImage(systemName: heart)
        likeButton.setImage(heartImage, for: .normal)
        
        starLabel.rating = data.grade ?? 0
        starLabel.settings.updateOnTouch = false
        starLabel.settings.fillMode = .precise
        starLabel.settings.starSize = 15
        starLabel.settings.starMargin = 1
        starLabel.settings.filledColor = UIColor.systemYellow
        starLabel.settings.emptyBorderColor = UIColor.systemYellow
        starLabel.settings.filledBorderColor = UIColor.systemYellow
    }
    
}
