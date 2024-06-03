//
//  UIImage+.swift
//  MagazineProject
//
//  Created by 양승혜 on 6/4/24.
//

import UIKit

extension UIImageView {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.width / 2
    }
}
