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
    func sendTapped(text: String)
}

class CustomInputView: UIView {
    
    // MARK: IVars
    
    weak var delegate: CustomInputViewDelegate?
    
    private lazy var attachButton = createButton(
        image: UIImage(named: "Attach_icon"),
        selector: #selector(attachTapped)
    )
    
    private lazy var sendButton = createButton(
        image: UIImage(named: "Send_icon"),
        selector: #selector(sendMessage),
        color: .blue
    )
    
    private func createButton(image: UIImage? = nil, selector: Selector, color: UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = color
        button.setTintedImage(image: image)
        button.imageEdgeInsets = Size.getInsets()
        button.addTarget(self, action: selector, for: .touchUpInside)
        addSubview(button)
        
        return button
    }
    
    let textField: CustomTextField = {
        let textField = CustomTextField(padding: Size.getInsets())
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .white
        textField.placeholder = "Write Message..."
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        isUserInteractionEnabled = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    // MARK: Lifecycle
    
    private func configureSubviews() {
        textField.delegate = self
        addSubview(textField)
        
        layoutSubviews()
        
        NSLayoutConstraint.activate([
            sendButton.heightAnchor.constraint(equalTo: heightAnchor),
            sendButton.widthAnchor.constraint(equalTo: heightAnchor),
            sendButton.topAnchor.constraint(equalTo: topAnchor),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.heightAnchor.constraint(equalTo: heightAnchor),
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor),
        ])
        
        setSendButtonIsHidden()
    }
    
    // MARK: Actions
    
    @objc func attachTapped() {
        #warning("tbd - add attach functionality")
    }
    
    @objc func sendMessage() {
        delegate?.sendTapped(text: textField.text!)
        textField.text = ""
        setSendButtonIsHidden()
    }
}

// MARK: UITextFieldDelegate

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

