//
//  GoalCell.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 20.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    
    @IBOutlet weak var noteTitleLbl: UILabel!
    @IBOutlet weak var noteBodyLbl: UILabel!


    func configureCell(goal: Goal) {
        
        self.noteTitleLbl.text = goal.goalTitle
        self.noteBodyLbl.text = goal.goalTextBody
    }
}
