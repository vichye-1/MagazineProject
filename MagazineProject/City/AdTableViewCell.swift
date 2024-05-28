//
//  adTableViewCell.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    
    static let adIdentifier = "AdTableViewCell"
    
    @IBOutlet var adBackgroundView: UIView!
    @IBOutlet var adTitleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLayout()
    }

    func configureLayout() {
        adTitleLabel.adTitleLabelUI()
        adBackgroundView.adbackgroundViewUI()
        adLabel.adBadgeLabelUI()
    }
    
    func configureCell(data: Travel) {
        adTitleLabel.text = data.title
    }
}
