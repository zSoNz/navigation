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
    
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var name: UILabel?
    @IBOutlet private var age: UILabel?
    @IBOutlet private var type: UILabel?
    @IBOutlet private var randomize: UIButton?
    
    //MARK: -
    //MARK: Overrided
    
    override func fill(with viewModel: PetViewModel) {
        self.imageView?.image = viewModel.petImage

        self.name?.text = viewModel.petName
        self.age?.text = viewModel.petAge
        self.type?.text = viewModel.petType
        self.randomize?.setTitle(L10n.randomize, for: .normal)
    }
    
    override func prepareBindings(disposeBag: DisposeBag) {
        self.randomize?.rx.tap
            .bind { [weak self] in self?.eventsEmiter.onNext(.fetchRandomPet) }
            .disposed(by: disposeBag)
    }
}
