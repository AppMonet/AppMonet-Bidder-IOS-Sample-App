//
//  AppDelegate.swift
//  AppMonet Bidder IOS Sample App
//
//  Created by Jose Portocarrero on 3/12/20.
//  Copyright © 2020 Monet. All rights reserved.
//

import UIKit
import CoreData
import AppMonet_Bidder

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
        var window: UIWindow?

        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            
            //AppMonet Initialization
            
            let appMonetConfiguration = AppMonetConfigurations .configuration { (AppMonetConfigurations) in
                AppMonetConfigurations?.applicationId = "3zeuyua"
            }
            AppMonet .initialize(appMonetConfiguration)
            return true
        }
    }


