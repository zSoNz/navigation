//
//  PetViewSpec.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/25/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Quick
import Nimble

import RxSwift
import RxCocoa

@testable import FlowComponents
@testable import Models

class PetViewSpec: QuickSpec {
    
    override func spec() {
        
        describe("the 'PetView'") {
            
            context("in any case") {
                it("randomize button shouldn't be usable") {
                    [FMock.cat, FMock.dog, .empty].forEach {
                        let viewModel = FMock.petViewModel(pet: $0)
                        let view = FMock.petView(viewModel: viewModel)
                        
                        expect(view.randomize?.isEnabled).notTo(beTrue())
                    }
                }
            }
        }
    }
}
