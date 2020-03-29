//
//  NoteCell.swift
//  LockedNotes
//
//  Created by Sunimal Herath on 29/3/20.
//  Copyright © 2020 Sunimal Herath. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    // IBOutlets
    @IBOutlet weak var noteLbl: UILabel!
    @IBOutlet weak var lockImg: UIImageView!    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(note: Note) {
        if note.lockStatus {
            noteLbl.text = "This note is locked - Unlock to read."
            lockImg.isHidden = false
        } else {
            noteLbl.text = note.message
            lockImg.isHidden = true
        }
    }
}
