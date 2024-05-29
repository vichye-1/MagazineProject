//
//  RestaurantTableViewCell.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/28/24.
//

import UIKit
import Kingfisher

class RestaurantTableViewCell: UITableViewCell {

    static let restaurantIdentifier = "RestaurantTableViewCell"
    
    @IBOutlet var indexLabel: UILabel!
    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var bookmarkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureRestaurantLayout()
        
    }

    func configureRestaurantLayout() {
        descriptionLabel.descriptionLabelUI()
        titleLabel.titleLabelUI()
        priceLabel.phoneNumberLabelUI()
        bookmarkButton.likeButtonUI()
        indexLabel.indexLabelUI()
    }
    
    func configureRestaurantCell(data: Restaurant) {
        // image
        let url = data.image
        let imageURL = URL(string: url)
        restaurantImage.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "timer"))
        restaurantImage.contentMode = .scaleAspectFill
        restaurantImage.layer.cornerRadius = 5
        
        // description label
        let location = data.address.split(separator: " ")[1]
        descriptionLabel.text = "\(data.category) · \(location)"
        
        // title Label
        titleLabel.text = data.name
        
        // price Label
        priceLabel.text = "\(data.price)원대"
        
        // bookmark Button
        let bookmark = data.like ? "bookmark.fill" : "bookmark"
        let bookmarkImage = UIImage(systemName: bookmark)
        bookmarkButton.setImage(bookmarkImage, for: .normal)
    }
}
