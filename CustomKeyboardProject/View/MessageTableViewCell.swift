//
//  MessageTableViewCell.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation
import UIKit


class MessageTableViewCell: UITableViewCell {
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        label.textColor = .darkText
        label.numberOfLines = 0
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        label.textColor = .gray
        label.numberOfLines = 1
        label.textAlignment = .right
        return label
    }()
    
    let replyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Reply_icon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return button
    }()
    
    func setCell(with message: Message) {
        
        // add subviews
        [bodyLabel, replyButton, timeLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        // constain subviews
        NSLayoutConstraint.activate([
            timeLabel.heightAnchor.constraint(equalToConstant: Size.timeSize),
            timeLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: Size.timeMaxWidthRatio),
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            replyButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: Size.buttonHeightRatio),
            replyButton.widthAnchor.constraint(equalTo: replyButton.heightAnchor),
            replyButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            replyButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Size.padding),
            
            bodyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Size.padding),
            bodyLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: -Size.padding),
            bodyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Size.padding),
            bodyLabel.rightAnchor.constraint(equalTo: replyButton.leftAnchor, constant: -Size.padding),
            
            timeLabel.rightAnchor.constraint(equalTo: bodyLabel.rightAnchor),
            ])
        
        
        bodyLabel.text = message.body
        timeLabel.text = message.timestamp.formatTimestamp()
        layoutIfNeeded()
    }
}

extension MessageTableViewCell {
    private struct Size {
        static let buttonHeightRatio: CGFloat = 0.5
        static let padding: CGFloat = 24
        static let timeSize: CGFloat = 24
        static let timeMaxWidthRatio: CGFloat = 0.5
    }
}
