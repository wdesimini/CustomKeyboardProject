//
//  CustomKeyboardView.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation
import UIKit

// https://stackoverflow.com/a/46510833/10582681

protocol CustomInputViewDelegate: class {
    func sendMessage()
}

class CustomInputView: UIView {
    
    lazy var textField = createTextField()
    
    private func createTextField() -> CustomTextField {
        let textField = CustomTextField(padding: Size.getInsets())
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.placeholder = "Write Message..."
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        addSubview(textField)
        return textField
    }
    
    private lazy var attachButton = createButton(
        image: UIImage(named: "Attach_icon"),
        selector: #selector(attachTapped))
    
    @objc func attachTapped() {
        
    }
    
    private lazy var sendButton = createButton(
        image: UIImage(named: "Send_icon"),
        selector: #selector(sendMessage),
        color: .blue)
    
    @objc func sendMessage() {
        delegate?.sendMessage()
        
        DispatchQueue.main.async {
            self.textField.text = ""
            self.setSendButtonIsHidden()
        }
    }
    
    private func createButton(image: UIImage? = nil, selector: Selector, color: UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        button.setTintedImage(image: image)
        button.imageEdgeInsets = Size.getInsets()
        button.addTarget(self, action: selector, for: .touchUpInside)
        addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: button.heightAnchor),
            button.heightAnchor.constraint(equalTo: textField.heightAnchor)
            ])
        
        return button
    }
    
    weak var delegate: CustomInputViewDelegate?
    
    init() {
        super.init(frame: .zero)
        isUserInteractionEnabled = true
        textField.delegate = self
        
        DispatchQueue.main.async {
            self.backgroundColor = .darkGray
            self.setViews()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setViews() {
        autoresizingMask = .flexibleHeight
        
        // center views
        subviews.forEach {
            NSLayoutConstraint.activate([
                $0.centerYAnchor.constraint(equalTo: centerYAnchor),
                ])
        }
        
        layoutSubviews()
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
//            attachButton.leftAnchor.constraint(equalTo: leftAnchor),
//            textField.leadingAnchor.constraint(equalTo: attachButton.trailingAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            sendButton.leadingAnchor.constraint(equalTo: textField.trailingAnchor),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        
        setSendButtonIsHidden()
    }

    override var intrinsicContentSize: CGSize {
        return .zero
    }
}

extension CustomInputView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setSendButtonIsHidden()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        setSendButtonIsHidden()
    }
    
    private func setSendButtonIsHidden() {
        if textField.text == "" || textField.text == nil {
            sendButton.isHidden = true
        } else {
            sendButton.isHidden = false
        }
    }
}

extension CustomInputView {
    private struct Size {
        static let keyboardHeight: CGFloat = 64
        
        static func getInsets() -> UIEdgeInsets {
            let textFieldInsetValue: CGFloat = 12
            
            return UIEdgeInsets(
                top: textFieldInsetValue,
                left: textFieldInsetValue,
                bottom: textFieldInsetValue,
                right: textFieldInsetValue)
        }
    }
}

