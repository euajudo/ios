//
//  Meteor.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import Foundation
import Meteor

let kNotificationDatabaseUpdated = "Database-Updated"

private let _APISharedInstance = API()

typealias APICompletationHandler = (AnyObject!, NSError!) -> Void

class API {
    static let connection = METDDPClient(serverURL: NSURL(string: "wss://euajudo.meteor.com/websocket"))
    static let database = API.connection.database

    var campaings: AnyObject?
    
    class var sharedInstance: API {
        return _APISharedInstance
    }
    
    func connect() {
        API.connection.connect()
    }
    
    // MARK: - Auth
    
    func authWithEmail(email: String, password: String, completion: METLogInCompletionHandler) {
        API.connection.loginWithEmail(email, password: email) { (error) -> Void in
            completion(error)
        }
    }
    
    func isLoggedOn() -> Bool {
        return API.connection.userID != nil
    }
    
    // MARK: - Campaings
    
    func allCampaings(completion: APICompletationHandler) {
        API.connection.callMethodWithName("allCampaigns", parameters: nil) { (response, error) -> Void in
            var list = [Campaign]()
    
            if let objs = response as? [[String: AnyObject]] {
                for obj in objs {
                    list.append(Campaign(dict: obj))
                }
            }
            
            completion(list, error)
        }
    }
}
