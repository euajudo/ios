//
//  CampaignsTableViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class CampaignsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reloadCampaigns()
        
        self.performSegueWithIdentifier("Campaign", sender: nil)
    }
    
    func reloadCampaigns() {
        self.refreshControl?.beginRefreshing()
        
        API.sharedInstance.allCampaings { (response, error) -> Void in
            self.refreshControl?.endRefreshing()
        }
    }
    
}
