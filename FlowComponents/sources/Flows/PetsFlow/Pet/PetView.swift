//
//  MVVMView.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

public class PetView: MVVMView<PetViewModel, PetConfigurator, PetViewModelOutputEvents, PetViewModelInputEvents> {
        
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var name: UILabel?
    @IBOutlet private var age: UILabel?
    @IBOutlet private var type: UILabel?
    @IBOutlet private var randomize: UIButton?

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
}
