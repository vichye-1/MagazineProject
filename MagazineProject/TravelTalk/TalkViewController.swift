//
//  TalkViewController.swift
//  MagazineProject
//
//  Created by 양승혜 on 6/3/24.
//

import UIKit

class TalkViewController: UIViewController {
    
    @IBOutlet var chatTableView: UITableView!
    
    let chatList = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TRAVEL TALK"
        configureChatTableView()
    }
    
    func configureChatTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let identifier = SingleChatTableViewCell.identifier
        let nib = UINib(nibName: identifier, bundle: nil)
        chatTableView.register(nib, forCellReuseIdentifier: identifier)
        
        chatTableView.rowHeight = 70
    }
}

extension TalkViewController: UITableViewDelegate,
                              UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = SingleChatTableViewCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell
    }
    
    
}
