//
//  RandomPetFetcherManagerType.swift
//  Managers
//
//  Created by IDAP Developer on 9/13/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

public protocol PetFetcherManagerType {
    
    init(provider: PetsFetcherProviderType)
    
    func pet(completion: (Pet) -> ())
}
