//
//  UIButton+Extension.swift
//  GoalsList
//
//  Created by Alex Berezovsky on 21.09.17.
//  Copyright © 2017 PatataMatata. All rights reserved.
//

import UIKit

extension UIButton {
    
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.2904499769, green: 0.6846023798, blue: 0.2108882666, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.5002971888, green: 0.7723235488, blue: 0.463128984, alpha: 1)
    }
}
