//
//  UIView+Extension.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/28/24.
//

import UIKit

extension UIView {
    func adbackgroundViewUI() {
        self.backgroundColor = randomColor()
        self.layer.cornerRadius = 8
    }
    
    func randomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }
}
