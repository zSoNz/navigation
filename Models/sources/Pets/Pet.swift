//
//  Pet.swift
//  Models
//
//  Created by IDAP Developer on 10/9/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import UIKitLib

public enum Animal: String {
    
    case dog
    case cat
    case none = "-"
}

public struct Pet: Model {
    
    //MARK: -
    //MARK: Acessors
    
    public let image: UIImage?
    public let name: String
    public let age: Int
    public let type: Animal
    
    public fileprivate(set) var isEmpty = false
    
    //MARK: -
    //MARK: Initializations
    
    static public var empty: Pet {
        let image = UIImage(color: .gray)
        var model = Pet(image: image, name: "-", age: -1, type: .none)
        
        model.isEmpty = true
        
        return model
    }
    
    public init(image: UIImage?, name: String, age: Int, type: Animal) {
        self.image = image
        self.name = name
        self.age = age
        self.type = type
    }
}
