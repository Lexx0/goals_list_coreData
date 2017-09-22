//
//  FinishGoalVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 21.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    
    @IBOutlet weak var headerForPointsLbl: UILabel!
    @IBOutlet weak var pointsTxtFld: UITextField!
    
    var goalDescription: String!
//    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()

    }
    
    func initialSetup() {
        createGoalBtn.bindToKeyBoard()
        pointsTxtFld.delegate = self
    }
    
//    func initData(description: String, type: GoalType) {
//        
//        self.goalDescription = description
//        self.goalType = type
//    }
    
    func saveData(completion: (_ finished: Bool) -> ()) {
  
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        
//        goal.goalDescription = goalDescription
//        goal.goalType = goalType.rawValue
//        goal.goalCompletionValue = Int32(pointsTxtFld.text!)!
//        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print("We've saved it alright ^&*()")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    

    @IBAction func createGoalBtnTapped(_ sender: Any) {
        
        if pointsTxtFld.text != nil {
            self.saveData { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        
        dissmissDetail()
    }
}
