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
    
    var _id: String!
    var name: String!
    var description: String!
    var createdAt: NSDate!
    var mainMedia: Media!
    var user: [String: String]!
    var url: String!

    init(dict: [String: AnyObject]) {
        self._id = dict["_id"] as! String
        self.name = dict["name"] as! String
        self.description = dict["description"] as! String
        self.user = dict["user"] as! [String: String]
        self.url = dict["canonicalUrl"] as! String
        self.createdAt = NSDate()
        
        if let media = dict["mainMedia"] as? [String: AnyObject] {
            self.mainMedia = Media(dict: media)
        }
    }

}
