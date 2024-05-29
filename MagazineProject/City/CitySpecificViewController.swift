//
//  CitySpecificViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit

class CitySpecificViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "관광지 화면"
        let popButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        
        navigationItem.setLeftBarButton(popButton, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc
    func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}
