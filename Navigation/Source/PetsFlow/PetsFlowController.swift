//
//  PetsFlowController.swift
//  Navigation
//
//  Created by IDAP Developer on 9/18/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import RxSwift

import FlowComponents
import Models

import Managers

enum PetsFlowControllerEvents: FlowEventAction {
    
}

class PetsFlowController: NavigationControllerContainer<NavigationControllerDefaultPresenter, PetsFlowControllerEvents> {
    
    //MARK: -
    //MARK: Variables
    
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: View Lifecylcle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showPets()
    }
    
    //MARK: -
    //MARK: Private
    
    private func show(pet: Pet) {
        let configurator = PetConfigurator(pet: pet)
        let viewModel = PetViewModel(configurator: configurator)
        let view = PetView(viewModel: viewModel)
        
        self.pushViewController(view, animated: true)
    }
    
    private func showPets() {
        let provider = LocalPetsFetcherProvider()
        let manager = PetsFetcherManager(provider: provider)
        let configurator = PetsConfigurator(pets: .init())
        let viewModel = PetsViewModel(with: configurator, manager: manager)
        let view = PetsView(viewModel: viewModel)
        
        viewModel
            .eventsEmiter
            .subscribe(onNext: self.handle)
            .disposed(by: self.disposeBag)
        
        self.pushViewController(view, animated: true)
    }
    
    private func handle(events: PetsViewModelEvents) {
        switch events {
        case .didSelectPet(let pet):
            self.show(pet: pet)
        default:
            break
        }
    }
}
