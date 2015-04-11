//
//  Meteor.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import Foundation
import Meteor

struct API {
    static let manager = METDDPClient(serverURL: NSURL(string: "wss://euajudo.meteor.com/websocket"))
}
