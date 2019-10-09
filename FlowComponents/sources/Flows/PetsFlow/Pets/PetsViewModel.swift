//
//  PetsViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

struct Fruit: PropertyMirroring {
    
    public let name: String
    public let type: Int
}

struct Animal: PropertyMirroring {
    
    public let name: String
    public let type: Int
}

public class PetsViewModel: ViewModel<Pets, PetsViewEvents> {
    
    let animal = Animal(name: "w", type: 1)
    let fruit = Fruit(name: "e", type: 2)
    
    var fruitName: String {
        return ""
    }
}
