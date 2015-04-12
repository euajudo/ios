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
    
    @IBOutlet weak var textFieldValue: UITextField!

    @IBOutlet weak var buttonPaymentMonthly: UIButton!
    @IBOutlet weak var buttonPaymentOnce: UIButton!

    @IBOutlet weak var imageViewRadioMonthly: UIImageView!
    @IBOutlet weak var imageViewRadioOnce: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = campaign.name
        
        textFieldValue.font = UIFont(name: "Lato-Regular", size: 98)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let controller = segue.destinationViewController as? PaymentInformationsViewController {
            controller.value = (textFieldValue.text as NSString).floatValue
            controller.isMonthly = isPaymentMonthly
            controller.campaign = campaign
        }
    }
    

    // MARK: - IBAction
    
    @IBAction func buttonPaymentMonthlyPressed(sender: AnyObject) {
        buttonPaymentMonthly.enabled = false
        buttonPaymentOnce.enabled = true
        
        isPaymentMonthly = true
        
        imageViewRadioMonthly.image = UIImage(named: "Radio-On")
        imageViewRadioOnce.image = UIImage(named: "Radio-Off")
    }
    
    @IBAction func buttonPaymentOncePressed(sender: AnyObject) {
        buttonPaymentMonthly.enabled = true
        buttonPaymentOnce.enabled = false
    
        isPaymentMonthly = false
        
        imageViewRadioMonthly.image = UIImage(named: "Radio-Off")
        imageViewRadioOnce.image = UIImage(named: "Radio-On")
    }
    
    @IBAction func buttonClosePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func buttonPaymentPressed(sender: AnyObject) {
        self.performSegueWithIdentifier("Payment", sender: nil)
    }
    
}
