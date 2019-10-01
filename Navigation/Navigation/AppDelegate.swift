//
//  AppDelegate.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import FlowComponents
import Managers
import Models

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: -
    //MARK: Accessors
    
    var window: UIWindow?

    //MARK: -
    //MARK: Private
    
    private func mainFlow() -> UIViewController {
        return AppFlowController(presenter: NavigationControllerModalPresenter.default)
    }
    
    //MARK: -
    //MARK: ApplicationDelegate
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = self.mainFlow()
        window.makeKeyAndVisible()
        
        return true
    }
}
