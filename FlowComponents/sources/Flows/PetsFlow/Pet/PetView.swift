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

public enum PetViewEvents: Events {
    
    case randomizeButtonDidTapped
}

public class PetView: MVVMView<PetViewModel, PetConfigurator, PetViewEvents> {
    
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var name: UILabel?
    @IBOutlet private var age: UILabel?
    @IBOutlet private var type: UILabel?
    @IBOutlet private var randomize: UIButton?
    
    //MARK: -
    //MARK: Overrided
    
    public override func fill(with viewModel: PetViewModel) {
        self.imageView?.image = viewModel.petImage

        self.name?.text = viewModel.petName
        self.age?.text = viewModel.petAge
        self.type?.text = viewModel.petType
    }
    
    override public func prepareBindings(disposeBag: DisposeBag) {
        self.randomize?.rx.tap
            .bind { [weak self] in self?.eventsEmiter.onNext(.randomizeButtonDidTapped) }
            .disposed(by: disposeBag)
    }
}
