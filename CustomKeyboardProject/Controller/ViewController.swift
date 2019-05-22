//
//  ViewController.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        #warning("TESTING: automatically going to inputView 1")
        segueToExampleController(keyboard: CustomInputView())
    }
    
    @IBAction func keyboardOneTapped(_ sender: Any) {
        // show first custom keyboard
        segueToExampleController(keyboard: CustomInputView())
    }
    
    func segueToExampleController(keyboard: CustomInputView) {
        navigationController?.pushViewController(ExampleViewController(), animated: true)
    }
}

