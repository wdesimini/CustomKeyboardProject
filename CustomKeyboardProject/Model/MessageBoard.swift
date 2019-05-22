//
//  MessageBoard.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation


final class MessageBoard {
    
    static let shared = MessageBoard()
    
    private var messages = Set<Message>()
    
    private init() {}
    
    func addMessage(message: Message) {
        messages.insert(message)
    }
}

extension MessageBoard {
    
    var sortedMessages: [Message] {
        return Array(messages).sorted(by: { $0.timestamp < $1.timestamp } )
    }
}

