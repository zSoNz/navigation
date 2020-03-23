//
//  PetViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Managers

import RxSwift
import RxRelay

import Models

public enum PetViewModelOutputEvents: Events {
    
    case neadFetchRandomPet
}

public enum PetViewModelInputEvents: Events {
    
    case fetchRandomPet
}

public class PetViewModel: ViewModel<PetConfigurator, PetViewModelOutputEvents, PetViewModelInputEvents> {
    
    //MARK: -
    //MARK: Accesors
    
    private let pet: BehaviorRelay<Pet>
    
    var petImage: Observable<UIImage?> {
        self.pet.map { $0.image }
    }
    
    var petName: Observable<String> {
        self.pet.map { $0.name.uppercased() }
    }
    
    var petAge: Observable<String>{
        self.pet.map {
            $0.isEmpty
                ? "-"
                : "ᕦ(ò_óˇ)ᕤ " + $0.age.description + " ᕦ(ò_óˇ)ᕤ"
        }
    }
    
    var petType: Observable<String> {
        self.pet.map {
            $0.isEmpty
                ? "-"
                : $0.type.rawValue.uppercased() + "\n(●´ω `●)"
        }
    }
    
    //MARK: -
    //MARK: Initializations
    
    public init(configurator: PetConfigurator) {
        self.pet = .init(value: configurator.pet)
        
        super.init(with: configurator)
    }
    
    override func handle(events: InputEvents) {
        switch events {
        case .fetchRandomPet:
            self.outputEventsEmiter.accept(.neadFetchRandomPet)
        }
    }
}

