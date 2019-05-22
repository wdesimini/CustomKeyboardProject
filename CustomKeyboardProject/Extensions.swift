//
//  Extensions.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/22/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation
import UIKit


// set tinted image for button

extension UIButton {
    
    func setTintedImage(image: UIImage?, tint: UIColor = .white, padding: UIEdgeInsets? = nil) {
        setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = tint
        
        if padding != nil {
            imageEdgeInsets = padding!
        }
    }
    
}

// format timestamp Ints

extension Double {
    
    func formatTimestamp() -> String {
        let dateFormatter = DateFormatter()
        
        let date = Date(timeIntervalSince1970: self)
        
        dateFormatter.timeStyle = .short
        
        if Calendar.current.isDateInToday(date) {
            dateFormatter.dateStyle = .none
        } else {
            dateFormatter.dateStyle = .short
        }
        
        return dateFormatter.string(from: date)
    }
}
