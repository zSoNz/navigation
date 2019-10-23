//
//  RX+Extensions.swift
//  Navigation
//
//  Created by IDAP Developer on 10/23/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import RxSwift

extension Observable {
    
    func weakZip<ValueType>(value: ValueType) -> Observable<(Element, ValueType?)>
        where ValueType: AnyObject
    {
        return self.map { [weak value] in ($0, value) }
    }
}
