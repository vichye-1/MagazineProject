//
//  CityTableViewCell.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var etcLabel: UILabel!
    @IBOutlet var cityImage: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
