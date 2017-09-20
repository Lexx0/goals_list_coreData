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

    
    func configureCell(description: String, type: String, goalProgressAmount: Int) {
        
        self.goalTypeLbl.text = type
        self.goalDescriptionLbl.text = description
        self.goalProgressLbl.text = String(describing: goalProgressAmount)
    }
}
