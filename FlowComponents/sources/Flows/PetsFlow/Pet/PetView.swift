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

public class PetView: MVVMView<PetViewModel, PetConfigurator> {
    
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: Outlets
    
    @IBOutlet private var imageView: UIImageView?
    @IBOutlet private var name: UILabel?
    @IBOutlet private var age: UILabel?
    @IBOutlet private var type: UILabel?
    @IBOutlet private var randomize: UIButton?

    //MARK: -
    //MARK: Overrided
    
    public override func configViewModel() {
        self.disposeBag.insert(
            self.bindText(self.viewModel.petName, to: self.name),
            self.bindText(self.viewModel.petAge, to: self.age),
            self.bindText(self.viewModel.petType, to: self.type),
            self.imageView.map { self.viewModel.petImage.bind(to: $0.rx.image) },
            self.randomize?.rx.tap.bind { [weak self] in self?.viewModel.fetchRandomPet() }
        )
    }
    
    private func bindText(_ item: Observable<String>, to: UILabel?) -> Disposable? {
        to.map { item.bind(to: $0.rx.text) }
    }
}
