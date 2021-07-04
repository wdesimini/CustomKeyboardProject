//
//  CustomTableView.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/12/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation
import UIKit


class CustomTableView: UITableView {
    public var keyboardView: CustomInputView?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        keyboardDismissMode = .interactive
        layoutSubviews()
        keyboardView = CustomInputView(frame: CGRect(origin: .zero, size: CGSize(width: frame.width, height: 64)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        keyboardView?.textField.resignFirstResponder()
    }

    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputAccessoryView: UIView? {
        return keyboardView
    }
}
