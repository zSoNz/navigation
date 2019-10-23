//
//  AppFlowController.swift
//  Navigation
//
//  Created by IDAP Developer on 9/18/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import FlowComponents

import Managers

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
        let provider = LocalPetsFetcherProvider()
        let manager = PetsFetcherManager(provider: provider)
        let flow = PetsFlowController(manager: manager)
        
        self.setViewControllers([flow], animated: true)
    }
}
