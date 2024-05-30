//
//  TravelInfoViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 5/29/24.
//

import UIKit

class TravelInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "인기 도시"
        setSegment()
        
    }
    
    func setSegment() {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "모두", at: 0, animated: true)
        segment.insertSegment(withTitle: "국내", at: 1, animated: true)
        segment.insertSegment(withTitle: "해외", at: 2, animated: true)
    }


}
