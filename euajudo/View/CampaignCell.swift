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
    var progressView: CampaignGoalView!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        progressView = NSBundle.mainBundle().loadNibNamed("CampaignGoalView", owner: self, options: nil)[0] as! CampaignGoalView
        
        self.containerView.addSubview(progressView)
        self.containerView.bringSubviewToFront(progressView.progress)
        
        let frameSize = progressView.frame
        progressView.frame = CGRectMake(progressView.frame.origin.x, self.frame.size.height - frameSize.height, self.frame.size.width, frameSize.height)
        
        progressView.setNeedsLayout()
        progressView.layoutIfNeeded()
        progressView.layoutSubviews()
        
        progressView?.campaign = campaign
        
        self.applyCardPattern()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyCardPattern()
    }
    
    func applyCardPattern() {
        let shadowPath = UIBezierPath(rect: self.containerView.bounds)
        self.layer.masksToBounds = false;
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset = CGSizeMake(1.0, 1.0);
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowPath = shadowPath.CGPath;
        self.layer.cornerRadius = 3.0;
    }
    
    func updateInformations() {
        labelTitle.text = campaign?.name
        labelDescription.text = campaign?.description
        
        unowned let weakSelf = self
        campaign?.mainMedia.image({ (image) -> Void in
            weakSelf.imageView.image = image
        })
        
        progressView?.campaign = campaign
    }

}
