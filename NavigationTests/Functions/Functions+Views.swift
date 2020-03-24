//
//  Functions+Views.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/25/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Foundation

import FlowComponents

extension FMock {
        
    static func petView(viewModel: PetViewModel) -> PetView {
        let view = PetView(viewModel: viewModel)
        view.loadViewIfNeeded()
        
        return view
    }
}
