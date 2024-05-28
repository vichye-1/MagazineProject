//
//  UIButton+Extension.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit

extension UIButton {
    func likeButtonUI() {
        self.setImage(UIImage(systemName: "bookmark"), for: .normal)
        self.setTitle("", for: .normal)
        self.tintColor = .white
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    func filterButtonUI() {
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = .systemOrange
        self.layer.cornerRadius = 15
        self.titleLabel?.textAlignment = .center
        self.titleLabel?.font = .boldSystemFont(ofSize: 17)
        
    }
}

