//
//  CosmosView+Extension.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/30/24.
//

import UIKit
import Cosmos

extension CosmosView {
    func starUI() {
        self.settings.updateOnTouch = false
        self.settings.fillMode = .precise
        self.settings.starSize = 15
        self.settings.starMargin = 1
        self.settings.filledColor = UIColor.systemYellow
        self.settings.emptyBorderColor = UIColor.systemYellow
        self.settings.filledBorderColor = UIColor.systemYellow
    }
}
