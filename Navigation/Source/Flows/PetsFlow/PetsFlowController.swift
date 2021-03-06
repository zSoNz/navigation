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
    private let manager: PetsFetcherManagerType
    
    //MARK: -
    //MARK: Initializations
    
    required init(manager: PetsFetcherManagerType, presenter: NavigationControllerDefaultPresenter = .default) {
        self.manager = manager
        
        super.init(presenter: presenter)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        let configurator = PetsConfigurator(pets: .init())
        let viewModel = PetsViewModel(with: configurator)
        let view = PetsView(viewModel: viewModel)
        
        viewModel.events
            .bind { [weak self] in self?.handle(event: $0) }
            .disposed(by: self.disposeBag)
        
        self.processPets(viewModel: viewModel)
        self.pushViewController(view, animated: true)
    }
    
    private func handle(event: PetsViewModelOutputEvents) {
        switch event {
        case .didSelectPet(let pet):
            self.show(pet: pet)
        }
    }
    
    private func processPets(viewModel: PetsViewModel) {
        self.manager.pets { [weak viewModel] in
            viewModel?.eventEmiter.accept(.updatePets($0))
        }
    }
}
