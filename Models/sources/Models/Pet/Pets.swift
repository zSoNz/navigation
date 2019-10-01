//
//  File.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

public struct Pets: Model {
    
    public let values: [Pet]
    
    public init(values: [Pet]) {
        self.values = values
    }
    
    public init() {
        self.values = []
    }
}
