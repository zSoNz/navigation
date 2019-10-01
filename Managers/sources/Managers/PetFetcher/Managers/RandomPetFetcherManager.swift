//
//  RandomPetFetcherManager.swift
//  Managers
//
//  Created by IDAP Developer on 9/13/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

public class RandomPetFetcherManager: PetFetcherManagerType {
    
    //MARK: -
    //MARK: Accesors
    
    let provider: PetsFetcherProviderType
    
    //MARK: -
    //MARK: Initializations
    
    public required init(provider: PetsFetcherProviderType) {
        self.provider = provider
    }
    
    //MARK: -
    //MARK: Public
    
    public func pet(completion: (Pet) -> ()) {
        self.provider.pets {
            $0.randomElement().map(completion)
        }
    }
}
