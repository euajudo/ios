//
//  PaymentInformationsViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/12/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit


class PaymentInformationsViewController: UIViewController {
    
    var campaign: Campaign?
    var value: Float?
    var isMonthly: Bool?
    
    @IBOutlet weak var buttonPayment: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    @IBOutlet weak var textFieldExpireDate: UITextField!
    @IBOutlet weak var textFieldSecurity: UITextField!
    

    // MARK: - IBAction
    
    @IBAction func buttonPaymentPressed(sender: AnyObject) {
        buttonPayment.setTitle("", forState: .Normal)
        activityIndicatorView.startAnimating()

        unowned let weakSelf = self
        API.connection.callMethodWithName("donate", parameters: [value!, campaign!._id]) { (response, error) -> Void in
            if error != nil {
                weakSelf.buttonPayment.setTitle("EFETUAR PAGAMENTO", forState: .Normal)
                weakSelf.activityIndicatorView.stopAnimating()
            } else {
                weakSelf.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
}