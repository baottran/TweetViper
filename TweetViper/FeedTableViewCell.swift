//
//  FeedTableViewCell.swift
//  TweetViper
//
//  Created by Bao  Tran on 8/10/17.
//  Copyright © 2017 Bao Tran. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    var screenNameLabel = UILabel()
    var statusLabel = UILabel()
    var timeStampLabel = UILabel()
    var profileIconView = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        prepareSubViews()
    }
    
    func prepareSubViews(){
        
        self.contentView.addSubview(statusLabel)
        self.contentView.addSubview(screenNameLabel)
        self.contentView.addSubview(profileIconView)
        self.contentView.addSubview(timeStampLabel)
        
        timeStampLabel.text = "lol"
        timeStampLabel.textAlignment = .right
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        profileIconView.translatesAutoresizingMaskIntoConstraints = false
        screenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        timeStampLabel.translatesAutoresizingMaskIntoConstraints = false

        // status label
        
        self.statusLabel.numberOfLines = 0
        
        statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 100).isActive = true
        statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -8).isActive = true
        statusLabel.topAnchor.constraint(equalTo: screenNameLabel.bottomAnchor, constant: 10).isActive = true
        statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        
        
        // screen name label
        
        screenNameLabel.leftAnchor.constraint(equalTo: statusLabel.leftAnchor).isActive = true
//        screenNameLabel.rightAnchor.constraint(equalTo: statusLabel.rightAnchor).isActive = true
        screenNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
    
        // profile icon
        
        profileIconView.leftAnchor.constraint(equalTo: contentView.leftAnchor,
                                              constant: 20).isActive = true
        profileIconView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: 10).isActive = true
        profileIconView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileIconView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        timeStampLabel.leftAnchor.constraint(equalTo: screenNameLabel.rightAnchor, constant: 10).isActive = true
        timeStampLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        timeStampLabel.topAnchor.constraint(equalTo: screenNameLabel.topAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
