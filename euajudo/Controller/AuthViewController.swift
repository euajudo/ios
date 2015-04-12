//
//  AuthViewController.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 11/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    // MARK: - Actions

    @IBAction func close(sender: UIBarButtonItem) {
        self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
    }

}
