//
//  CreateGoalVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 21.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    
    @IBOutlet weak var noteTitleTextView: UITextView!
    @IBOutlet weak var noteDescriptoinTextView: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    
//    var goalType: GoalType = .shortTerm
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfig()
    }


    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
//        if goalDescriptoinTextView.text != "" && goalDescriptoinTextView.text != "What is your Goal?" {
//            
//            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else { return }
//            
//            finishGoalVC.initData(description: self.goalDescriptoinTextView.text!, type: self.goalType)
//            
////            presentDetail(finishGoalVC)
//            presentingViewController?.presentSecondaryDetail(finishGoalVC)
//        }
        if noteTitleTextView.text == "Создайте заголовок" {
            noteTitleTextView.text = ""
        }
        
        if noteDescriptoinTextView.text != "" || noteDescriptoinTextView.text != "А тут будет текст заметки" {
            self.saveData { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dissmissDetail()
    }
    
    
    
    
    func initialConfig() {
        
        nextBtn.bindToKeyBoard()
        
        noteDescriptoinTextView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        noteDescriptoinTextView.text = ""
        noteDescriptoinTextView.textColor = UIColor.black
    }
    
    func saveData(completion: (_ finished: Bool) -> ()) {
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let goal = Goal(context: managedContext)
        
        goal.goalTitle = noteTitleTextView.text
        goal.goalTextBody = noteDescriptoinTextView.text

        
        do {
            try managedContext.save()
            print("We've saved it alright ^&*()")
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
