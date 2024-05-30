//
//  UILabel+Extension.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/27/24.
//

import UIKit

extension UILabel {
    func titleLabelUI() {
        self.font = .boldSystemFont(ofSize: 15)
        self.textAlignment = .left
        self.textColor = .black
        self.numberOfLines = 0
    }
    
    func descriptionLabelUI() {
        self.font = .systemFont(ofSize: 13)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func adTitleLabelUI() {
        self.font = .boldSystemFont(ofSize: 15)
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
    
    func indexLabelUI() {
        self.backgroundColor =  .systemOrange
        self.clipsToBounds = true
        self.layer.cornerRadius = 5
        self.font = .boldSystemFont(ofSize: 17)
        self.textAlignment = .center
    }
    
    func specificTitleLabelUI() {
        self.font = .boldSystemFont(ofSize: 25)
        self.textAlignment = .left
        self.textColor = .black
        self.numberOfLines = 0
    }
    
    func specificStarLabelUI() {
        self.font = .systemFont(ofSize: 15)
        self.textColor = .lightGray
        self.textAlignment = .left
        self.numberOfLines = 0
    }

    func specificDescriptionLabelUI() {
        self.font = .systemFont(ofSize: 17)
        self.textColor = .black
        self.textAlignment = .left
        self.numberOfLines = 0
    }
    
    func adSpecificTitleLabelUI() {
        self.font = .boldSystemFont(ofSize: 20)
        self.textAlignment = .center
        self.textColor = .black
        self.numberOfLines = 0
    }

}
