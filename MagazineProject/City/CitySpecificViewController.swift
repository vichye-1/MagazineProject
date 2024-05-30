//
//  CitySpecificViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit
import Kingfisher

class CitySpecificViewController: UIViewController {
    
    @IBOutlet var citySpecificImage: UIImageView!
    @IBOutlet var specificLikeButton: UIButton!
    @IBOutlet var citySpecificTitle: UILabel!
    @IBOutlet var starSpecificLabel: UILabel!
    @IBOutlet var citySpecificDescription: UILabel!
    
    @IBOutlet var locationButton: UIButton!
    
    var passData: Travel?

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let passData = passData else { return }
        navigationItem.title = passData.title
        
        if let url = passData.travel_image {
            let imageURL = URL(string: url)
            citySpecificImage.kf.setImage(with: imageURL, placeholder: UIImage(systemName: "timer"))
            citySpecificImage.layer.cornerRadius = 15
            citySpecificImage.contentMode = .scaleAspectFill
        }
        citySpecificTitle.text = passData.title
        citySpecificTitle.specificTitleLabelUI()
        
        starSpecificLabel.text = "별점 \(passData.grade ?? 0.0) | \(passData.save ?? 0)개 리뷰"
        starSpecificLabel.specificStarLabelUI()
        
        citySpecificDescription.text = passData.description
        citySpecificDescription.specificDescriptionLabelUI()
        
        specificLikeButton.setTitle("", for: .normal)
        specificLikeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        specificLikeButton.tintColor = .white
        
        let popButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonClicked))
        
        navigationItem.setLeftBarButton(popButton, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    @objc
    func backButtonClicked() {
        navigationController?.popViewController(animated: true)
    }

}
