//
//  NoteObjects.swift
//  LockedNotes
//
//  Created by Sunimal Herath on 29/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import Foundation

var notes: [Note] = [
    Note(message: "iOS app to test Touch ID and Face ID with Storyboard", lockStatus: true),
    Note(message: "This is another note which can be locked and unlocked", lockStatus: false),
    Note(message: "Note 3 with some valuable information. Better to be locked", lockStatus: true),
    Note(message: "Sample note for locking and unlocking", lockStatus: false)
]

//func loadNotes() -> [Note]{
//    let note1 = Note(message: "iOS app to test Touch ID and Face ID with Storyboard", lockStatus: true)
//    let note2 = Note(message: "This is another note which can be locked and unlocked", lockStatus: false)
//    let note3 = Note(message: "Note 3 with some valuable information. Better to be locked", lockStatus: true)
//    let note4 = Note(message: "Sample note for locking and unlocking", lockStatus: false)
//
//    notes.append(note1)
//    notes.append(note2)
//    notes.append(note3)
//    notes.append(note4)
//
//    return notes
//}
