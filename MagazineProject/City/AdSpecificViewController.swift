//
//  AdSpecificViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit

class AdSpecificViewController: UIViewController {
    
    @IBOutlet var adLabel: UILabel!
    
    var adPassData: Travel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let adPassData = adPassData else { return }
        adLabel.text = adPassData.title
        adLabel.adSpecificTitleLabelUI()
        
        navigationItem.title = "광고 화면"
        let dismissButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(xmarkClicked))
        
        navigationItem.setLeftBarButton(dismissButton, animated: true)
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @objc
    func xmarkClicked() {
        dismiss(animated: true)
    }
}
