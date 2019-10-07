//
//  PetsViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

struct Animal: PropertyMirroring {
    
    public let name: String
}

public class PetsViewModel: ViewModel<Pets, PetsViewEvents> {
    let animal = Animal(name: "w")
    
}
