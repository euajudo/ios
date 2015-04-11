//
//  DonateViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController {
    
    var campaign: Campaign!
    
    // MARK: IBAction
    
    @IBAction func buttonClosePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
