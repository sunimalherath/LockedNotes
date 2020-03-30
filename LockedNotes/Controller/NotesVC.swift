//
//  NotesVC.swift
//  LockedNotes
//
//  Created by Sunimal Herath on 29/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit
import LocalAuthentication // to use TouchID or FaceID features

class NotesVC: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Functions
    func authenticateWithBioMetrics(completion: @escaping (Bool) -> Void) {
        let authContext = LAContext()
        let localizedReasonString = "The app uses touch ID to lock notes"
        var authError: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authError) { // use & in front of authError to pass the error data back to authError variable
            authContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: localizedReasonString) { (success, evalError) in
                if success {
                    DispatchQueue.main.async {
                        completion(true)
                    }
                } else {
                    DispatchQueue.main.async {
                        guard let evalErrorString = evalError?.localizedDescription else { return }
                        print(evalErrorString)
                        self.alertUser(withMessage: evalErrorString)
                        completion(false)
                    }
                }
            }
        } else {
            guard let authErrorString = authError?.localizedDescription else { return }
            print(authErrorString)
            alertUser(withMessage: authErrorString)
            completion(false)
        }
    }
    
    func alertUser(withMessage message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let noteDetailVC = storyboard?.instantiateViewController(withIdentifier: "noteDetailVC") as? NoteDetailVC else { return }
        noteDetailVC.note = notes[indexPath.row]
        noteDetailVC.index = indexPath.row
        
        if notes[indexPath.row].lockStatus == true {
            authenticateWithBioMetrics { (authenticated) in
                if authenticated {
                    notes[indexPath.row].lockStatus = false
                    DispatchQueue.main.async {
                        self.navigationController?.pushViewController(noteDetailVC, animated: true)
                    }
                }
            }
        } else {
            navigationController?.pushViewController(noteDetailVC, animated: true)
        }
    }
}

