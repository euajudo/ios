//
//  SettingsTableViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/12/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController {
    
    // MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            let url = NSURL(string: "http://euajudo.meteor.com")
            UIApplication.sharedApplication().openURL(url!)
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            API.connection.logoutWithCompletionHandler { (error) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
    
    override func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 1 {
            return "1.0.0 (1)"
        }
        
        return nil
    }
    
    
    // MARK: - IBAction

    @IBAction func buttonClosePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
