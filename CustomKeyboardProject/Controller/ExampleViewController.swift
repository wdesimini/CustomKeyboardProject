//
//  ExampleViewController.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import UIKit


private let reuseId = "MessageCellId"

class ExampleViewController: UITableViewController {
    
    private let customTableView = CustomTableView()
    
    // initiate Singleton
    var messageBoard = MessageBoard.shared
    
    override func loadView() {
        tableView = customTableView
        view = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.becomeFirstResponder()
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: reuseId)
        customTableView.keyboardView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customTableView.keyboardView.textField.becomeFirstResponder()
    }
    
    // tableView delegate methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageBoard.sortedMessages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! MessageTableViewCell
        cell.setCell(with: messageBoard.sortedMessages[indexPath.row])
        return cell
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        customTableView.keyboardView.textField.resignFirstResponder()
    }
}

extension ExampleViewController: CustomInputViewDelegate {
    func sendMessage() {
        // double check something is in textField
        let textField = customTableView.keyboardView.textField
        guard let body = textField.text, body != "" else { return }
        let message = body.createMessageFromBody()
        messageBoard.addMessage(message: message)
        tableView.reloadData()
        
        DispatchQueue.main.async {
            self.view.endEditing(true)
        }
    }
}

