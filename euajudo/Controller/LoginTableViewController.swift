//
//  LoginTableViewController.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 11/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    lazy var login: UIBarButtonItem = {
        return UIBarButtonItem(title: "Entrar", style: .Done, target: self, action: "login:")
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        return UIActivityIndicatorView(activityIndicatorStyle: .White)
    }()
    
    // MARK: - View Life Cycle 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.login
    }
    
    // MARK: - Actions
    
    func login(sender: UIBarButtonItem) {
        if self.areAllInputsValid() {
            self.startLoading()
        
            API.sharedInstance.authWithEmail(self.email.text, password: self.password.text, completion: { (error) -> Void in
                self.stopLoading()
                
                if let error = error {
                    self.stopLoading()
                
                    let loginErrorAlert = UIAlertController(
                        title: "Oops!",
                        message: "Ocorreu algum problema durante a autenticação, tente novamente.",
                        preferredStyle: .Alert
                    )
                    
                    let confirmAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    loginErrorAlert.addAction(confirmAction)
                    
                    self.presentViewController(loginErrorAlert, animated: true, completion: nil)
                } else {
                    self.dismissSelf()
                }
            })
        }
    }
    
    func dismissSelf() {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func forgotPassword(sender: UIButton) {
        // TODO: Show forgot password view
    }
    
    // MARK: Validations
    
    func areAllInputsValid() -> Bool {
        var areAllInputsValid = true
        
        areAllInputsValid = self.email.text.isEmpty ? false : true
        areAllInputsValid = self.password.text.isEmpty ? false : true
        
        return areAllInputsValid
    }
    
    // MARK: Loading Helpers
    
    func startLoading() {
        self.activityIndicator.startAnimating()
        
        let activityIndicatorBarItem = UIBarButtonItem(customView: self.activityIndicator)
        self.navigationItem.rightBarButtonItem = activityIndicatorBarItem
    }
    
    func stopLoading() {
        self.activityIndicator.stopAnimating()
        
        self.navigationItem.rightBarButtonItem = self.login
    }
    
    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == self.email {
            self.password.becomeFirstResponder()
        }
        
        if textField == self.password {
            login(self.login)
        }
        
        return true
    }
    
}
