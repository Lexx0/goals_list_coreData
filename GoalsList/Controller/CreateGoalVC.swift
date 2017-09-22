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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfig()
    }


    
    @IBAction func nextBtnPressed(_ sender: Any) {
        
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
        
        noteTitleTextView.delegate = self
        noteDescriptoinTextView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView == noteDescriptoinTextView {
            noteDescriptoinTextView.text = ""
            noteDescriptoinTextView.textColor = UIColor.black
        } else if textView == noteTitleTextView {
            noteTitleTextView.text = ""
            noteTitleTextView.textColor = UIColor.black
        }
        
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
