//
//  CampaignDetailViewController.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit


class CampaignDetailViewController: UIViewController {
    
    var campaign: Campaign!

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelReceiverName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle.text = campaign.name
        labelReceiverName.text = "nome do usuário"
        labelDescription.text = campaign.description
        
        unowned let weakSelf = self
        campaign.mainMedia.image { (image) -> Void in
            weakSelf.imageView.image = image
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = self.contentView.frame.size
    }
    
    
    // MARK: IBAction

    @IBAction func buttonSharePressed(sender: AnyObject) {
        let objectsToShare = ["Foobar"]
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.presentViewController(activity, animated: true, completion: nil)
    }
}