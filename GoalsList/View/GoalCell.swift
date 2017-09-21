//
//  GoalCell.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 20.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!

    
    func configureCell(goal: Goal) {
        
        self.goalTypeLbl.text = goal.goalType!
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
    }
}
