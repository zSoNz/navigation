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

public enum PetsViewModelEvents: Events {
    
    case didSelect(indexPath: IndexPath)
    case didSelectPet(Pet)
}

public class PetsViewModel: ViewModel<PetsConfigurator, PetsViewModelEvents> {
    
    //MARK: -
    //MARK: Variables
    
    public var petsValues: [Pet] {
        return self.pets.values
    }
    
    public let manager: PetsFetcherManagerType
    
    private(set) public var pets: Pets
    
    //MARK: -
    //MARK: Initializations
    
    public required init(with configurator: PetsConfigurator, manager: PetsFetcherManagerType) {
        self.pets = configurator.pets
        
        self.manager = manager
        
        super.init(with: configurator)
        
        self.prepareData()
    }
    
    //MARK: -
    //MARK: Private
    
    private func prepareData() {
        self.manager.pets(completion: { [weak self] in
            self?.pets = Pets(values: $0)
            
            self?.internalEventsEmiter.onNext(.didUpdated)
        })
    }
    
    //MARK: -
    //MARK: Override
    
    override func handle(events: PetsViewModelEvents) {
        switch events {
        case .didSelect(indexPath: let index):
            self.eventsEmiter.onNext(.didSelectPet(self.pets.values[index.row]))
        default:
            break
        }
    }
}
