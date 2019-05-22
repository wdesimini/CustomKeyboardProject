//
//  CustomButton.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/22/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation
import UIKit


class CustomButton: UIButton {
    
    var color: UIColor
    
    override var tintColor: UIColor! {
        didSet {
            setTintedImage()
        }
    }
    
    var image: UIImage? {
        didSet {
            setTintedImage()
        }
    }
    
    init(frame: CGRect, color: UIColor, image: UIImage?) {
        self.color = color
        self.image = image
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTintedImage() {
        backgroundColor = color
        setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
        tintColor = .white
    }
    
}
