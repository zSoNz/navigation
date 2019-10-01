//
//  PetFetcherProvider.swift
//  Managers
//
//  Created by IDAP Developer on 9/13/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

public class LocalPetsFetcherProvider: PetsFetcherProviderType {
    
    //MARK: -
    //MARK: Initializations
    
    public required init() {
        
    }
    
    //MARK: -
    //MARK: Private
    
    private func pets() -> [Pet] {
        let image = {
            return UIImage(named: $0)
        }
        
        return [
            Pet(image: image("dog"), name: "Sharik", age: 5, type: .dog),
            Pet(image: image("cat"), name: "Vatrushka", age: 2, type: .cat),
            Pet(image: image("dog"), name: "Penechek", age: 10, type: .dog),
            Pet(image: image("cat"), name: "Mamushka", age: 12, type: .cat)
        ]
    }
    
    //MARK: -
    //MARK: PetFetcherProviderType
    
    public func pets(completion: ([Pet]) -> ()) {
        completion(self.pets())
    }
}
