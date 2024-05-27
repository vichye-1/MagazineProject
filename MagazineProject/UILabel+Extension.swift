//
//  UILabel+Extension.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit

extension UILabel {
    func titleLabelUI() {
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .left
        self.textColor = .black
    }
    
    func descriptionLabelUI() {
        self.font = .systemFont(ofSize: 15)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func adTitleLabelUI() {
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .center
        self.textColor = .black
    }
    
    func adBadgeLabelUI() {
        self.text = "AD"
        self.font = .boldSystemFont(ofSize: 17)
        self.backgroundColor = .white
        self.layer.cornerRadius = 15
        self.textAlignment = .center
    }
}
