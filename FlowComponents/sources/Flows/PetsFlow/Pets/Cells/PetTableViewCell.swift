//
//  PetTableViewCell.swift
//  FlowComponents
//
//  Created by IDAP Developer on 10/9/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import TableAdapter

import Models

enum PetTableViewCellEvents {
    
}

class PetTableViewCell: BaseCell<Pet, PetTableViewCellEvents> {

    @IBOutlet private var petImageView: UIImageView?
    @IBOutlet private var name: UILabel?
    @IBOutlet private var age: UILabel?
    @IBOutlet private var type: UILabel?
    
    //MARK: -
    //MARK: Public
    
    override func fill(with pet: Pet) {
        self.petImageView?.image = pet.image
        self.name?.text = pet.name
        self.age?.text = pet.age.description
        self.type?.text = pet.type.rawValue
    }
}
