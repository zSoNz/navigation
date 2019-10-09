//
//  PetConfigurator.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Models

public struct PetConfigurator: Configurator {
    
    public let pet: Pet
    
    public init(pet: Pet = .empty) {
        self.pet = pet
    }
}
