//
//  CampaignsTableViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class CampaignsTableViewController: UITableViewController {

    var campaigns: [Campaign]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 90.0
        
        self.campaigns = Campaign.sampleCampaigns()
    }
    
}


// MARK: UITableViewDataSource


extension CampaignsTableViewController: UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.campaigns.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("campaignCell", forIndexPath: indexPath) as! UITableViewCell
        
        let campaign = self.campaigns[indexPath.row]
        
        let campaignImage = cell.viewWithTag(100) as! UIImageView
        let name = cell.viewWithTag(200) as! UILabel
        let description = cell.viewWithTag(300) as! UILabel
        
        campaign.mainMedia.image({ (image) -> Void in
            campaignImage.image = image
            return
        })
        
        name.text = campaign.name
        description.text = campaign.description
    
        return cell
    }
    
}