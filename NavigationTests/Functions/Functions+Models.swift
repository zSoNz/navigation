//
//  Functions+Models.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/25/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

import Models

extension FMock {
    
    static var cat: Pet {
        return Pet(image: nil, name: "Mamushka", age: 11, type: .cat)
    }
    
    static var dog: Pet {
        return Pet(image: nil, name: "Mamushka", age: 11, type: .dog)
    }
}
