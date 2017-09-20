//
//  UIViewController+Extension.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 20.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail (_ viewContyrollerToPresent: UIViewController) {
        
        let transiotion = CATransition()
        transiotion.duration = 0.3
        transiotion.type = kCATransitionPush
        transiotion.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transiotion, forKey: kCATransition)
        
        present(viewContyrollerToPresent, animated: false, completion: nil)
    }
    
    func dissmissDetail() {
        
        let transiotion = CATransition()
        transiotion.duration = 0.3
        transiotion.type = kCATransitionPush
        transiotion.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transiotion, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
