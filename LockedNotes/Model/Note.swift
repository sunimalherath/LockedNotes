//
//  Note.swift
//  LockedNotes
//
//  Created by Sunimal Herath on 29/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import Foundation

class Note {
    public private(set) var message: String
    public var lockStatus: Bool
    
    init(message: String, lockStatus: Bool) {
        self.message = message
        self.lockStatus = lockStatus
    }
}
