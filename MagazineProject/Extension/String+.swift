//
//  String+.swift
//  MagazineProject
//
//  Created by 양승혜 on 6/3/24.
//

import Foundation

extension String {
    // dateforamtter 이용해서 string -> yy년 MM월 dd일 형식으로 변환
    var korFullDateStr: String? {
        let date = self
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyMMdd"
        
        if let convertDate = myFormatter.date(from: date) {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yy년 MM월 dd일"
            let convertStr = dateformatter.string(from: convertDate)
            return convertStr
        }
        return nil
    }
    
    var chatDateStr: String? {
        let date = self
        let myFormatter = DateFormatter()
        myFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        if let convertDate = myFormatter.date(from: date) {
            let dateformatter = DateFormatter()
            dateformatter.dateFormat = "yy.MM.dd"
            let convertStr = dateformatter.string(from: convertDate)
            return convertStr
        }
        return nil
    }
}
