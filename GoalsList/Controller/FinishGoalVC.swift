//
//  FinishGoalVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 21.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    
    @IBOutlet weak var headerForPointsLbl: UILabel!
    @IBOutlet weak var pointsTxtFld: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()

    }
    
    func initialSetup() {
        createGoalBtn.bindToKeyBoard()
        pointsTxtFld.delegate = self
    }
    
    func initData(description: String, type: GoalType) {
        
        self.goalDescription = description
        self.goalType = type
    }
    

    @IBAction func createGoalBtnTapped(_ sender: Any) {
        
        // тут будет: Pass data to CoreData Goal Model
    }
    
}
