//
//  PetViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Managers

import Models

public class PetViewModel: ViewModel<PetConfigurator, PetViewEvents> {
    
    //MARK: -
    //MARK: Accesors
    
    private let manager: RandomPetFetcherManager
    
    public var pet: Pet
    
    //MARK: -
    //MARK: Initializations
    
    public init(manager: RandomPetFetcherManager, model: PetConfigurator) {
        self.manager = manager
        self.pet = model.pet
        
        super.init(with: model)
    }
    
    //MARK: -
    //MARK: Private
    
    private func randomizePet() {
        self.manager.pet { [weak self] in
            self?.pet = $0
            
            self?.eventsEmiter.onNext(.didUpdated)
        }
    }
    
    //MARK: -
    //MARK: Overrided
    
    override public func handle(events: PetViewEvents) {
        switch events {
        case .randomizeButtonDidTapped:
            self.randomizePet()
        }
    }
}

