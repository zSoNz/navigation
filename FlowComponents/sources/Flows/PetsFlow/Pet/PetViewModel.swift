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
    
    private(set) var pet: Pet
    
    var petName: String {
        return self.pet.name.uppercased()
    }
    
    var petAge: String {
        let age = "ᕦ(ò_óˇ)ᕤ " + self.pet.age.description + " ᕦ(ò_óˇ)ᕤ"
        return self.pet.isEmpty ? "-" : age
    }
    
    var petType: String {
        let type = self.pet.type.rawValue.uppercased() + "\n(●´ω `●)"
        return self.pet.isEmpty ? "-" : type
    }
    
    //MARK: -
    //MARK: Initializations
    
    public init(manager: RandomPetFetcherManager, configurator: PetConfigurator) {
        self.manager = manager
        self.pet = configurator.pet
        
        super.init(with: configurator)
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

