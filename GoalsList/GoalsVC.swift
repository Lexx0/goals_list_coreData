//
//  VGoalsVC.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 20.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tablewView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablewView.delegate = self
        tablewView.dataSource = self
        tablewView.isHidden = false

    }

    @IBAction func goalBtnPressed(_ sender: Any) {
        
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") else { return }
        
        presentDetail(createGoalVC)
    }
}


extension GoalsVC: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tablewView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell()}
        
        cell.configureCell(description: "Eat shit and fart", type: .shortTerm, goalProgressAmount: 2)
//        cell.configureCell(description: "Eat shit and fart", type: "short term", goalProgressAmount: 2)
        
        return cell
        
    }
}
