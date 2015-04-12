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
    
    func updateInformations() {
        labelTitle.text = campaign?.name
        labelDescription.text = campaign?.description
        
        unowned let weakSelf = self
        campaign?.mainMedia.image({ (image) -> Void in
            weakSelf.imageView.image = image
        })
    }

}
