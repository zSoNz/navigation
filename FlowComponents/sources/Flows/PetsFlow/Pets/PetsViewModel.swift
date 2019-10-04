//
//  PetsViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

struct Test: PropertyMirroring {
    
    let a: String
}

protocol PropertyContainer { }

public class PetsViewModel: ViewModel<Pets, PetsViewEvents> {
    let test: Test = Test(a: "w")
    
}
