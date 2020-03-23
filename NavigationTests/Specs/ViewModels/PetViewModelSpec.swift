//
//  PetViewModelSpec.swift
//  River-Mall-Tests
//
//  Created by IDAP Developer on 12/23/19.
//  Copyright © 2019 IDAP. All rights reserved.
//

import Quick
import Nimble
import RxNimble

import RxSwift
import RxCocoa

@testable import FlowComponents
@testable import Models

class PetViewModelSpec: QuickSpec {

    let disposeBag = DisposeBag()
    
    override func spec() {
        
        describe("the 'PetViewModel'") {
            
            context("if has non-empty pet model") {
                let pet = FMock.cat
                let viewModel = FMock.petViewModel(pet: pet)
                
                it("should contains all converted values") {
                    self.validate(viewModel: viewModel, pet: pet)
                }
            }
            
            context("if has empty model") {
                let viewModel = FMock.petViewModel(pet: .empty)

                it("should contains 'empty' accesors") {
                    expect(viewModel.petAge).first(timeout: 2) == "-"
                    expect(viewModel.petType).first(timeout: 2) == "-"
                    expect(viewModel.petName).first(timeout: 2) == "-"
                }
            }

            context("if pet type is 'cat'") {
                let pet = FMock.cat
                let viewModel = FMock.petViewModel(pet: pet)
                let view = FMock.petView(viewModel: viewModel)

                it("should send 'fetchRandomFact' when randomize button on view tapped") {
                    FMock.delay(1) {
                        view.randomize?.sendActions(for: .touchUpInside)
                    }
                    
                    expect(viewModel.events).first(timeout: 2) == .neadFetchRandomPet
                }
            }
        }
    }
    
    private func validate(viewModel: PetViewModel, pet: Pet) {
        let petType = pet.type.rawValue.uppercased() + "\n(●´ω `●)"
        let petAge = "ᕦ(ò_óˇ)ᕤ " + pet.age.description + " ᕦ(ò_óˇ)ᕤ"
        let petName = pet.name.uppercased()

        expect(viewModel.petAge).first(timeout: 2) == petAge
        expect(viewModel.petType).first(timeout: 2) == petType
        expect(viewModel.petName).first(timeout: 2) == petName
    }
}
