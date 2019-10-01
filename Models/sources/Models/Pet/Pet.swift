//
//  PetModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

public enum Animal: String {
    
    case dog
    case cat
}

public struct Pet: Model {
    
    public let image: UIImage?
    public let name: String
    public let age: Int
    public let type: Animal
    
    public init(image: UIImage?, name: String, age: Int, type: Animal) {
        self.image = image
        self.name = name
        self.age = age
        self.type = type
    }
}
