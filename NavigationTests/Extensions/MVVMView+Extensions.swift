//
//  MVVMView+Extensions.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/25/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

import FlowComponents

extension MVVMView {
    
    convenience init(viewModel: ViewModelType) {
        let bundle = Bundle(for: Self.self)
        
        self.init(viewModel: viewModel, bundle: bundle)
    }
}
