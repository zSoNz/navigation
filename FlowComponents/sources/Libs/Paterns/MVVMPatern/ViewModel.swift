//
//  ViewModel.swift
//  Navigation
//
//  Created by IDAP Developer on 9/5/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

open class ViewModel<ConfiguratorType: Configurator> {

    //MARK: -
    //MARK: Variables
    
    internal let configurator: ConfiguratorType
    
    //MARK: -
    //MARK: Initializations
    
    public init(with configurator: ConfiguratorType) {
        self.configurator = configurator
    }
}
