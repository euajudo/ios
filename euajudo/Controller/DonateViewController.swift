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
    var isPaymentMonthly: Bool = true
    
    @IBOutlet weak var buttonPaymentMonthly: UIButton!
    @IBOutlet weak var buttonPaymentOnce: UIButton!

    
    // MARK: IBAction
    
    @IBAction func buttonPaymentMonthlyPressed(sender: AnyObject) {
        buttonPaymentMonthly.enabled = false
        buttonPaymentOnce.enabled = true
        
        isPaymentMonthly = true
    }
    
    @IBAction func buttonPaymentOncePressed(sender: AnyObject) {
        buttonPaymentMonthly.enabled = true
        buttonPaymentOnce.enabled = false
    
        isPaymentMonthly = false
    }
    
    @IBAction func buttonClosePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func buttonPaymentPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("Payment", sender: nil)
    }
    
}
