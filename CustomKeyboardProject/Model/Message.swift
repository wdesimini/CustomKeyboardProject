//
//  Message.swift
//  CustomKeyboardProject
//
//  Created by Wilson Desimini on 5/9/19.
//  Copyright © 2019 Wilson Desimini. All rights reserved.
//

import Foundation

struct Message: Hashable {
    
    // MARK: IVars
    
    let body: String
    let identifier: UUID
    let parentIdentifier: UUID?
    let timestamp: Double
    
    // MARK: Init
    
    init(
        body: String,
        identifier: UUID,
        parentIdentifier: UUID? = nil,
        timestamp: Double
    ) {
        self.body = body
        self.identifier = identifier
        self.parentIdentifier = parentIdentifier
        self.timestamp = timestamp
    }
    
    // MARK: Hashable
    
    static func == (lhs: Message, rhs: Message) -> Bool {
        lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
