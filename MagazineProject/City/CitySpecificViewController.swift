//
//  CitySpecificViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit

class CitySpecificViewController: UIViewController {
    
    @IBOutlet var citySpecificImage: UIImageView!
    @IBOutlet var citySpecificTitle: UILabel!
    @IBOutlet var cityReview: UILabel!
    @IBOutlet var citySpecificDescription: UILabel!
    
    var passData: Travel?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let passData = passData else { return }
        navigationItem.title = passData.title
        citySpecificTitle.text = passData.title
        cityReview.text = "\(passData.grade ?? 0.0) | \(passData.save ?? 0)명이 좋아해요"
        citySpecificDescription.text = passData.description
        
        let popButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        
        navigationItem.setLeftBarButton(popButton, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc
    func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}
