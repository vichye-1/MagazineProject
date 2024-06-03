//
//  SingleChatTableViewCell.swift
//  MagazineProject
//
//  Created by 양승혜 on 6/3/24.
//

import UIKit

class SingleChatTableViewCell: UITableViewCell {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nickNameLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var chatDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureSingleChatLayout()
    }
    
    func configureSingleChatLayout() {
        profileImage.makeCircle()
    }
    
    func configureSingleChatCell(data: ChatRoom) {
        let chatImage = data.chatroomImage
        if chatImage.count > 1 {
            profileImage.image = UIImage(systemName: "star")
        } else {
            profileImage.image = UIImage(named: chatImage[0])
            nickNameLabel.text = data.chatroomName
            contentLabel.text = data.chatList.last?.message
            
            let chatDate = data.chatList.last?.date
            chatDateLabel.text = chatDate?.chatDateStr
        }
    }
}
