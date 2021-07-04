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
    
    // MARK: IVars
    
    private let customTableView = CustomTableView()
    var messageBoard = MessageBoard()
    
    // MARK: CVars
    
    var messages: [Message] {
        messageBoard.sortedMessages
    }
    
    // MARK: Overrides
    
    override func loadView() {
        tableView = customTableView
        view = tableView
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        tableView.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        messages.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseId) as! MessageTableViewCell
        cell.setCell(with: messages[indexPath.row])
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customTableView.keyboardView?.textField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.becomeFirstResponder()
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: reuseId)
        customTableView.keyboardView?.delegate = self
    }
}

// MARK: CustomInputViewDelegate

extension ExampleViewController: CustomInputViewDelegate {
    func sendTapped(text: String) {
        messageBoard.add(messageWithBody: text)
        tableView.reloadData()
        tableView.becomeFirstResponder()
    }
}

