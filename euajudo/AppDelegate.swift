//
//  AppDelegate.swift
//  euajudo
//
//  Created by Rafael Kellermann Streit on 4/11/15.
//  Copyright (c) 2015 euajudo. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        API.manager.connect()

        return true
    }

}
