//
//  PetsFetcherManager.swift
//  TableAdapter
//
//  Created by IDAP Developer on 10/9/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Models

public class PetsFetcherManager: PetsFetcherManagerType {
    
    //MARK: -
    //MARK: Variables
    
    private let provider: PetsFetcherProviderType
    
    //MARK: -
    //MARK: Initializations
    
    public required init(provider: PetsFetcherProviderType) {
        self.provider = provider
    }
    
    //MARK: -
    //MARK: Public
    
    public func pets(completion: ([Pet]) -> ()) {
        self.provider.pets(completion: completion)
    }
}
