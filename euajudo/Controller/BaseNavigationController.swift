//
//  BaseNavigationController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let color = UIColor(red: 1, green: 78.0/255, blue: 106/255, alpha: 1)

        navigationBar.barTintColor = color
        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:  UIColor.whiteColor()]
    }

}
