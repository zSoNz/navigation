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

public class PetViewModel: ViewModel<Pet, PetViewEvents> {
    
    //MARK: -
    //MARK: Accesors
    
    private let manager: RandomPetFetcherManager
    
    //MARK: -
    //MARK: Initializations
    
    public init(manager: RandomPetFetcherManager, model: Pet) {
        self.manager = manager
        
        super.init(with: model)
    }
    
    //MARK: -
    //MARK: Private
    
    private func randomizePet() {
        self.manager.pet { [weak self] in
            self?.modelEmiter.accept($0)
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

