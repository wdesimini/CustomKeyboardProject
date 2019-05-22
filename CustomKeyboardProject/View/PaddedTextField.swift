//
//  PaddedTextField.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/22/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation
import UIKit


class PaddedTextField: UITextField {
    
    var padding: UIEdgeInsets
    
    init(frame: CGRect = .zero, padding: UIEdgeInsets) {
        self.padding = padding
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
