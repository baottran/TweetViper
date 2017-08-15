//
//  Tweet.swift
//  TweetViper
//
//  Created by Bao  Tran on 8/10/17.
//  Copyright © 2017 Bao Tran. All rights reserved.
//

import Foundation
import UIKit

struct TweetEntity {
    var id: String
    var text: String
    var screenName: String
    var profileImageURLString: String
    var profileImage: UIImage?
    var date: Date
    
    init?(json: [String: Any]){
        guard let id = json["id_str"] as? String,
            let text = json["text"] as? String,
            let userData = json["user"] as? [String: Any],
            let profileImageURLString = userData["profile_image_url_https"] as? String,
            let screenName = userData["screen_name"] as? String else {
            return nil
        }
        
        self.id = id
        self.screenName = screenName
        self.text = text
        self.profileImageURLString = profileImageURLString
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM dd HH:mm:ss +zzzz yyyy"
        
        if let dateString = json["created_at"] as? String, let date = formatter.date(from: dateString) {
            self.date = date
        } else {
            return nil
        }
        
    }
    
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy hh:mm"
        return formatter.string(from: self.date)
    }
}
