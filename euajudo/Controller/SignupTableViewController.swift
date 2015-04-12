//
//  SignupTableViewController.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 11/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class SignupTableViewController: UITableViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirmation: UITextField!
    
    lazy var signUp: UIBarButtonItem = {
        return UIBarButtonItem(title: "Cadastrar", style: .Done, target: self, action: "signUp:")
    }()
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        return UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    }()

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.signUp
    }
    
    // MARK: - Actions
    
    func signUp(signUp: UIBarButtonItem) {
        if self.areAllInputsValid() {
            self.startLoading()
            
            let params = ["name": self.name.text,
                          "email": self.email.text,
                          "password": self.password.text,
                          "passwordConfirmation": self.passwordConfirmation.text]
            
            API.sharedInstance.signUpWith(params: params, completion: { (error) -> Void in
                if let err = error {
                    let signUpErrorAlert = UIAlertController(title: "Oops!",
                        message: "Ocorreu algum problema durante seu cadastro, tente novamente.",
                        preferredStyle: .Alert)
                    
                    let confirmAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
                    signUpErrorAlert.addAction(confirmAction)
                    
                    self.presentViewController(signUpErrorAlert, animated: true, completion: nil)
                } else {
                    let email = params["email"] as String!
                    let password = params["password"] as String!
                    
                    
                }
            })
        }
    }
    
    func dismisSelf() {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: Validations
    
    func areAllInputsValid() -> Bool {
        var areAllInputsValid = true
        
        areAllInputsValid = self.name.text.isEmpty ? false : true
        areAllInputsValid = self.email.text.isEmpty ? false : true
        areAllInputsValid = self.password.text.isEmpty ? false : true
        areAllInputsValid = self.passwordConfirmation.text.isEmpty ? false : true
        
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
        
        self.navigationItem.rightBarButtonItem = self.signUp
    }
}
