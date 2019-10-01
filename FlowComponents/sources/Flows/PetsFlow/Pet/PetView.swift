//
//  MVVMView.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import Models

import RxSwift
import RxCocoa

public enum PetViewEvents: Events {
    
    case randomizeButtonDidTapped
}

public class PetView: MVVMView<Pet, PetViewEvents> {
    
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet private var image: UIImageView?
    @IBOutlet private var name: UILabel?
    @IBOutlet private var age: UILabel?
    @IBOutlet private var type: UILabel?
    @IBOutlet private var randomize: UIButton?
    
    //MARK: -
    //MARK: Overrided
    
    override public func fill(with model: Pet) {
        self.image?.image = model.image
        self.name?.text = model.name
        self.age?.text = model.age.description
        self.type?.text = model.type.rawValue.uppercased()
    }
    
    override public func prepareBindings(disposeBag: DisposeBag) {
        self.randomize?.rx.tap
            .bind { [weak self] in self?.eventsEmiter.onNext(.randomizeButtonDidTapped) }
            .disposed(by: disposeBag)
    }
}
