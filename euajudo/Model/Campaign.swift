//
//  Campaign.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import Foundation

/**
    Campaing model.

    :param: name Campaign name.
    :param: description Campaing description.
    :param: createdAt Campaing creation date.
    :param: mainMedia Dictionary with main media values (type, url and videoUrl if is a video)
*/

class Campaign {
    
    var name: String!
    var description: String!
    var createdAt: NSDate!
    var mainMedia: Media!
    
    static func sampleCampaigns() -> [Campaign] {
        var campaigns = [Campaign]()
        
        for i in 0..<10 {
            let campaign = Campaign()
            campaign.name = "Campanha \(i)"
            campaign.description = "Descrição da campanha \(i)"
            campaign.createdAt = NSDate()
            campaign.mainMedia = Media()
            
            campaigns.append(campaign)
        }
    
        return campaigns
    }

}
