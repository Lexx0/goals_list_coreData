//
//  VGoalsVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 20.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {

    @IBOutlet weak var tablewView: UITableView!
    
    var goals: [Goal] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialConfigue()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchCoreDataObjects()
        
        tablewView.reloadData()
    }

    @IBAction func goalBtnPressed(_ sender: Any) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        
        presentDetail(createGoalVC)
    }
    
    func fetchCoreDataObjects() {
        self.fetch { (complete) in
            if complete {
                if self.goals.count >= 1 {
                    tablewView.isHidden = false
                    //                    tablewView.reloadData()
                    
                } else {
                    tablewView.isHidden = true
                }
            }
        }
    }
    
    func initialConfigue() {
        
        print("Goals count \(goals.count)")
        
        tablewView.delegate = self
        tablewView.dataSource = self
        tablewView.isHidden = false
    }
}


extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tablewView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell()}
        
        guard goals != [] else {print("нет заметок"); return UITableViewCell()}
        
        let goal = goals[indexPath.row]
        
        cell.configureCell(goal: goal)
        
//        cell.configureCell(description: goal.goalDescription!, type: GoalType(rawValue: goal.goalType!)!, goalProgressAmount: Int(goal.goalProgress))
//        cell.configureCell(description: "Eat crap", type: "short term", goalProgressAmount: 2)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        print("ПРОВЕРОЧКА 111")
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            
            print("ПРОВЕРОЧКА 222")
            
            self.removeGoal(atIndexpath: indexPath)
            self.fetchCoreDataObjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        return [deleteAction]
    }
}

extension GoalsVC {
    
    func removeGoal(atIndexpath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {print("OI !!!"); return}
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("removed item NUMBA \(indexPath.row)")
        } catch {
            debugPrint("counld not remove \(error.localizedDescription)")
        }
    }
    
    func fetch(completion: (_ complete: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        
        do {
            self.goals = try managedContext.fetch(fetchRequest)
            print("fetched data is OK")
            completion(true)
        } catch {
            debugPrint("Could not fetch \(error.localizedDescription)")
            completion(false)
        }
        
    }
}








