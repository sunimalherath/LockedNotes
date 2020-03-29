//
//  NoteDetailVC.swift
//  LockedNotes
//
//  Created by Sunimal Herath on 29/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class NoteDetailVC: UIViewController {

    // IBOutlets
    @IBOutlet weak var noteTextView: UITextView!
    
    // Variables
    var note: Note! // passing note from the tableview
    var index: Int! // to indentify the note been locked
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteTextView.text = note.message
    }
    
    // IBActions
    @IBAction func lockNoteBtnWasPressed(_ sender: Any) {
        notes[index].lockStatus = true
        navigationController?.popViewController(animated: true)
    }
}
