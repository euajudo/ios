//
//  CampaignCell.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class CampaignCell: UICollectionViewCell {
    
    var campaign: Campaign?

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        let progressView = NSBundle.mainBundle().loadNibNamed("CampaignGoalView", owner: self, options: nil)[0] as! CampaignGoalView

        self.containerView.addSubview(progressView)
        self.containerView.bringSubviewToFront(progressView.progress)

        let frameSize = progressView.frame
        progressView.frame = CGRectMake(progressView.frame.origin.x, self.frame.size.height - frameSize.height, self.frame.size.width, frameSize.height)
        
        progressView.setNeedsLayout()
        progressView.layoutIfNeeded()
        progressView.layoutSubviews()
        
        progressView.campaign = campaign
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        let progressView = NSBundle.mainBundle().loadNibNamed("CampaignGoalView", owner: self, options: nil)[0] as! CampaignGoalView
//        progressView.campaign = campaign
//        progressView.frame = CGRect(x: 0.0, y: 386.0, width: self.bounds.width, height: 50.0)
//        
//        println(progressView.progress.bounds)
//        
//        self.addSubview(progressView)
//        self.bringSubviewToFront(progressView.progress)
    }
    
    func updateInformations() {
        labelTitle.text = campaign?.name
        labelDescription.text = campaign?.description
        
        unowned let weakSelf = self
        campaign?.mainMedia.image({ (image) -> Void in
            weakSelf.imageView.image = image
        })
    }

}
