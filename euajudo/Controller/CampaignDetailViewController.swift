//
//  CampaignDetailViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit


class CampaignDetailViewController: UIViewController {
    
    var campaign: Campaign?


    @IBAction func buttonSharePressed(sender: AnyObject) {
        let objectsToShare = [textToShare, myWebsite]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        self.presentViewController(activityVC, animated: true, completion: nil)
    }
}