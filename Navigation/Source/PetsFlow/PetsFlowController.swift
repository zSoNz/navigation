//
//  PetsFlowController.swift
//  Navigation
//
//  Created by IDAP Developer on 9/18/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import FlowComponents
import Models

import Managers

enum PetsFlowControllerEvents: FlowEventAction {
    
}

class PetsFlowController: NavigationControllerContainer<NavigationControllerDefaultPresenter, PetsFlowControllerEvents> {
    
    //MARK: -
    //MARK: View Lifecylcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showPets()
    }
    
    //MARK: -
    //MARK: Private
    
    private func showPet() {
        let provider = LocalPetsFetcherProvider()
        let manager = RandomPetFetcherManager(provider: provider)
        let configurator = PetConfigurator()
        let viewModel = PetViewModel(manager: manager, configurator: configurator)
        let view = PetView(viewModel: viewModel)
        
        self.pushViewController(view, animated: true)
    }
    
    private func showPets() {
        let provider = LocalPetsFetcherProvider()
        let manager = PetsFetcherManager(provider: provider)
        let configurator = PetsConfigurator(pets: .init())
        let viewModel = PetsViewModel(with: configurator, manager: manager)
        let view = PetsView(viewModel: viewModel)
        
        self.pushViewController(view, animated: true)
    }
}
