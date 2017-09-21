//
//  CreateGoalVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 21.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    
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
        
        if goalDescriptoinTextView.text != "" && goalDescriptoinTextView.text != "What is your Goal?" {
            
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
            
            finishGoalVC.initData(description: self.goalDescriptoinTextView.text!, type: self.goalType)
            
//            presentDetail(finishGoalVC)
            presentingViewController?.presentSecondaryDetail(finishGoalVC)
        }
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
        
        goalDescriptoinTextView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalDescriptoinTextView.text = ""
        goalDescriptoinTextView.textColor = UIColor.black
    }
    
}
