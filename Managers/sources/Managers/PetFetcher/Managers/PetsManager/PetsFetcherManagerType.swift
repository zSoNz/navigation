//
//  PetsFetcherManagerType.swift
//  TableAdapter
//
//  Created by IDAP Developer on 10/9/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import Foundation

import Models

public protocol PetsFetcherManagerType {

    init(provider: PetsFetcherProviderType)
       
    func pets(completion: ([Pet]) -> ())
}
