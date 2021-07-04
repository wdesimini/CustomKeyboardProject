//
//  MessageBoard.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation

struct MessageBoard {
    
    // MARK: IVars
    
    private var messages = Set<Message>()
    
    // MARK: CVars
    
    var sortedMessages: [Message] {
        Array(messages).sorted(
            by: { $0.timestamp < $1.timestamp }
        )
    }
    
    // MARK: Updates
    
    private mutating func add(message: Message) {
        messages.insert(message)
    }
    
    mutating func add(messageWithBody body: String) {
        add(
            message: Message(
                body: body,
                identifier: UUID(),
                timestamp: Date().timeIntervalSince1970
            )
        )
    }
}
