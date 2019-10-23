//
//  PetsViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Managers

import Models

public enum PetsViewModelOutputEvents: Events {
    
    case didSelect(indexPath: IndexPath)
    case didSelectPet(Pet)
    case needDowloadPets
}

public enum PetsViewModelInputEvents: Events {

}

public class PetsViewModel: ViewModel<PetsConfigurator, PetsViewModelOutputEvents, PetsViewModelInputEvents> {
    
    //MARK: -
    //MARK: Variables
    
    public var petsValues: [Pet] {
        return self.pets.values
    }
    
    private(set) public var pets: Pets
    
    //MARK: -
    //MARK: Initializations
    
    public required override init(with configurator: PetsConfigurator) {
        self.pets = configurator.pets
        
        super.init(with: configurator)
        
        self.internalEventsEmiter.onNext(.needDowloadPets)
    }
    
    //MARK: -
    //MARK: Override
    
    override func handle(events: PetsViewModelOutputEvents) {
        switch events {
        case .didSelect(indexPath: let index):
            self.internalEventsEmiter.onNext(.didSelectPet(self.pets.values[index.row]))
        default:
            break
        }
    }
}
