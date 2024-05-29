//
//  AdSpecificViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit

class AdSpecificViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
