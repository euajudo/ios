//
//  LoginTableViewController.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 11/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    lazy var login: UIBarButtonItem = {
        return UIBarButtonItem(title: "Entrar", style: .Done, target: self, action: "login:")
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        return UIActivityIndicatorView(activityIndicatorStyle: .Gray)
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
                    let loginErrorAlert = UIAlertController(title: "Oops!",
                                                            message: "Ocorreu algum problema durante a autenticação, tente novamente.",
                                                            preferredStyle: .Alert)
                    
                    let confirmAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    loginErrorAlert.addAction(confirmAction)
                    
                    self.presentViewController(loginErrorAlert, animated: true, completion: nil)
                }
            })
        }
    }
    
    @IBAction func close(sender: UIBarButtonItem) {
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
    
}
