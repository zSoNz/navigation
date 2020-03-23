//
//  MVVMView.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Resources

import RxSwift
import RxCocoa

public class PetView: MVVMView<PetViewModel, PetConfigurator, PetViewModelOutputEvents, PetViewModelInputEvents> {
        
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet internal var imageView: UIImageView?
    @IBOutlet internal var name: UILabel?
    @IBOutlet internal var age: UILabel?
    @IBOutlet internal var type: UILabel?
    @IBOutlet internal var randomize: UIButton?

    //MARK: -
    //MARK: Overrided

    override func prepareBindings(disposeBag: DisposeBag) {
        disposeBag.insert(
            self.viewModel.petName ~> self.name,
            self.viewModel.petAge ~> self.age,
            self.viewModel.petType ~> self.type,
            self.viewModel.petImage ~> self.imageView,
            self.randomize?.rx.tap.map { .fetchRandomPet } ~> self.eventsEmiter
        )
    }
    
    override func prepareLocalization() {
        self.randomize?.setTitle(L10n.randomize, for: .normal)
    }
}
