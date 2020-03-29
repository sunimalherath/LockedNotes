//
//  NotesVC.swift
//  LockedNotes
//
//  Created by Sunimal Herath on 29/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class NotesVC: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension NotesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as? NoteCell else {
            return UITableViewCell()
        }
        cell.configureCell(note: notes[indexPath.row])
        return cell
    }
}

