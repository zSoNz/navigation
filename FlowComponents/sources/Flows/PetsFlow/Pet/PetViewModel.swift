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

public enum PetViewModelOutputEvents: Events {
    
    case fetchRandomPet
}

public enum PetViewModelInputEvents: Events {
    
    case fetchRandomPet
}

public class PetViewModel: ViewModel<PetConfigurator, PetViewModelOutputEvents, PetViewModelInputEvents> {
    
    //MARK: -
    //MARK: Accesors
    
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
    
    public init(configurator: PetConfigurator) {
        self.pet = configurator.pet
        
        super.init(with: configurator)
    }
}

