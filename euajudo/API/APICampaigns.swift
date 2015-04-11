//
//  APICampaigns.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import Foundation

extension API {
    
    func campaings(completionHandler: APICompletationHandler) {
        API.manager.callMethodWithName("campaings", parameters: nil) { (response, error) -> Void in
            completionHandler(response, error)
        }
    }
    
}