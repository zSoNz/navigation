//
//  AppFlowController.swift
//  Navigation
//
//  Created by IDAP Developer on 9/18/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import FlowComponents

enum AppFlowControllerEvents: FlowEventAction {
    
}

class AppFlowController: NavigationFlowViewController<NavigationControllerModalPresenter, AppFlowControllerEvents> {

    //MARK: -
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showPetsFlow()
        
        self.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: -
    //MARK: Private
    
    private func showPetsFlow() {
        let flow = PetsFlowController(presenter: .default)
        
        self.setViewControllers([flow], animated: true)
    }
}
