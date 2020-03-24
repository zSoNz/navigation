//
//  Functions.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/25/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

enum FMock { }

extension FMock {
    
   static func delay(_ delay: Double, _ action: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            action()
        }
    }
}
