//
//  CreateGoalVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 21.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    
    @IBOutlet weak var goalDescriptoinTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType: GoalType = .shortTerm
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfig()
    }


    
    @IBAction func nextBtnPressed(_ sender: Any) {
    }
    
    
    @IBAction func shortTermBtnPressed(_ sender: Any) {
        
        goalType = .shortTerm
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
    }
    
    @IBAction func longTermBtnPressed(_ sender: Any) {
        
        goalType = .longTerm
        shortTermBtn.setDeselectedColor()
        longTermBtn.setSelectedColor()
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dissmissDetail()
    }
    
    
    func initialConfig() {
        
        nextBtn.bindToKeyBoard()
        shortTermBtn.setSelectedColor()
        longTermBtn.setDeselectedColor()
        
    }
    
}
