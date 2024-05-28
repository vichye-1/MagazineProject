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
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .center
        self.textColor = .black
        self.numberOfLines = 0
    }
    
    func adBadgeLabelUI() {
        self.text = "AD"
        self.font = .systemFont(ofSize: 15)
        self.backgroundColor = .white
        self.textAlignment = .center
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
    }
    
    func phoneNumberLabelUI() {
        self.font = .systemFont(ofSize: 13)
        self.textAlignment = .left
        self.textColor = .lightGray
    }
}
