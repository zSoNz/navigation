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


public class PetViewModel: ViewModel<PetConfigurator> {
    
    //MARK: -
    //MARK: Accesors
    
    private let pet: BehaviorRelay<Pet>
    
    public let fetchRandomPetEvent = PublishRelay<Void>()
    
    var petImage: Observable<UIImage?> {
        self.pet.map { $0.image }
    }
    
    var petName: Observable<String> {
        self.pet.map { $0.name.uppercased() }
    }
    
    var petAge: Observable<String>{
        self.pet.map {
            return $0.isEmpty
                ? "-"
                : "ᕦ(ò_óˇ)ᕤ " + $0.age.description + " ᕦ(ò_óˇ)ᕤ"
        }
    }
    
    var petType: Observable<String> {
        self.pet.map {
            return $0.isEmpty
                ? "-"
                : $0.type.rawValue.uppercased() + "\n(●´ω `●)"
        }
    }
    
    public func fetchRandomPet() {
        self.fetchRandomPetEvent.accept(())
    }
    
    //MARK: -
    //MARK: Initializations
    
    public init(configurator: PetConfigurator) {
        self.pet = .init(value: configurator.pet)
        
        super.init(with: configurator)
    }
}

