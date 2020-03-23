//
//  PetsViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Managers

import RxSwift
import RxRelay

import Models

public enum PetsViewModelOutputEvents: Events {
    
    case didSelectPet(Pet)
}

public enum PetsViewModelInputEvents: Events {

    case didSelecting(indexPath: IndexPath)
    case updatePets([Pet])
}

public class PetsViewModel: ViewModel<PetsConfigurator, PetsViewModelOutputEvents, PetsViewModelInputEvents> {
    
    //MARK: -
    //MARK: Variables
    
    public var pets: Observable<Pets> {
        self.petsEmitter.asObservable()
    }
    
    private let petsEmitter: BehaviorRelay<Pets>
    
    //MARK: -
    //MARK: Initializations
    
    public required override init(with configurator: PetsConfigurator) {
        self.petsEmitter = .init(value: configurator.pets)
        
        super.init(with: configurator)
    }
    
    //MARK: -
    //MARK: Override
    
    override func handle(events: PetsViewModelInputEvents) {
        switch events {
        case .updatePets(let models):
            let pets = Pets(values: models)
            self.petsEmitter.accept(pets)
        case .didSelecting(let indexPath):
            let pet = self.petsEmitter.value.values[indexPath.row]
            self.outputEventsEmiter.accept(.didSelectPet(pet))
        }
    }
}
