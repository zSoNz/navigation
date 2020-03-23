//
//  Functions+ViewModel.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/25/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

import FlowComponents

import Models

extension FMock {
    
    static func petViewModel(pet: Pet) -> PetViewModel {
        let configurator = PetConfigurator(pet: pet)
        return PetViewModel(configurator: configurator)
    }
}
