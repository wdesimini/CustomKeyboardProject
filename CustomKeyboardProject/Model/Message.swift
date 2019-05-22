//
//  Message.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation


class Message {
    // primary
    let timestamp: Double
    let body: String
    
    // secondary
    let parentMessage: Message?
    
    init(timestamp: Double, body: String, parentMessage: Message? = nil) {
        self.timestamp = timestamp
        self.body = body
        self.parentMessage = parentMessage
    }
}

extension String {
    
    func createMessageFromBody(parentMessage: Message? = nil) -> Message {
        return Message(
            timestamp: Double(NSDate().timeIntervalSince1970),
            body: self,
            parentMessage: parentMessage)
    }
    
}

extension Message: Hashable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.timestamp == rhs.timestamp && lhs.body == rhs.body
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(timestamp)
        hasher.combine(body)
    }
}
