//
//  CampaignGoalView.swift
//  euajudo
//
//  Created by Filipe Alvarenga on 12/04/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

class CampaignGoalView: UIView {

    var campaign: Campaign! {
        didSet {
            self.generatePercentage()
        }
    }

    @IBOutlet weak var progressContainer: UIView!
    @IBOutlet weak var progress: UIView!
    
    func generatePercentage() {
        var percentage = (((campaign.donatedValue * 100.0) / campaign.targetValue) / 100)
        
        if percentage > 1 {
            percentage = 1
        }

        let progressWidth = self.progressContainer.bounds.width * CGFloat(percentage)

        self.progress.layer.frame = CGRect(
            x: 0.0,
            y: 0.0,
            width: progressWidth,
            height: self.progress.bounds.height
        )
    }
}
