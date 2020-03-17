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

public class PetsViewModel: ViewModel<PetsConfigurator> {
    
    //MARK: -
    //MARK: Variables
    
    public var pets: Observable<Pets> {
        self.petsEmitter.asObservable()
    }
    
    public var selectedPet: Observable<Pet> {
        self.selectedPetEmitter.asObservable()
    }
    
    private let petsEmitter: BehaviorRelay<Pets>
    private let selectedPetEmitter = PublishRelay<Pet>()
    
    //MARK: -
    //MARK: Initializations
    
    public required override init(with configurator: PetsConfigurator) {
        self.petsEmitter = .init(value: configurator.pets)
        
        super.init(with: configurator)
    }
    
    //MARK: -
    //MARK: Public
    
    public func selectPet(by index: Int) {
        let pet = self.petsEmitter.value.values[index]
        self.selectedPetEmitter.accept(pet)
    }
    
    public func update(pets: Pets) {
        self.petsEmitter.accept(pets)
    }
}
