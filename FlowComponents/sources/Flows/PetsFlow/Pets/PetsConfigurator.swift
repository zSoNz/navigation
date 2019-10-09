//
//  PetsConfigurator.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

public struct PetsConfigurator: Configurator {
    
    public let pets: Pets
    
    public init(pets: Pets) {
        self.pets = pets
    }
}
