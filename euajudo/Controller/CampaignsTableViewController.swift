//
//  CampaignsTableViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class CampaignsTableViewController: UITableViewController {

    var campaigns = [Campaign]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 90.0
        
        self.reloadCampaigns()
    }
    
    func reloadCampaigns() {
        self.refreshControl?.beginRefreshing()
        
        API.sharedInstance.allCampaings { (response, error) -> Void in
            if let campaigns = response as? [[String: AnyObject]] {
                for obj in campaigns {
                    let campaign = Campaign(dict: obj)
                    
                    self.campaigns.append(campaign)
                }
            }
        
            self.refreshControl?.endRefreshing()
        }
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
        })
        
        name.text = campaign.name
        description.text = campaign.description
    
        return cell
    }
    
}