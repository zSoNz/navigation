//
//  PetsView.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import TableAdapter
import RxSwift

public class PetsView: MVVMView<PetsViewModel, PetsConfigurator> {
    
    @IBOutlet private var tableView: UITableView?
    
    private let disposeBag = DisposeBag()
    
    //MARK: -
    //MARK: Accesors
    
    private lazy var adapter: TableAdapter = {
        let adapter = TableAdapter(table: self.tableView, cells: [PetTableViewCell.self])
        adapter.eventHandler = { [weak self] in
            self?.handle(events: $0)
        }
        
        return adapter
    }()
        
    //MARK: -
    //MARK: Private
    
    private func handle(events: TableViewEvents) {
        switch events {
        case .didSelect(let index):
            self.viewModel.selectPet(by: index.row)
        default: break
        }
    }
    
    //MARK: -
    //MARK: Overrided
    
    public override func configViewModel() {
        self.viewModel.pets
            .map { [Section(cell: PetTableViewCell.self, models: $0.values)] }
            .bind { [weak self] in
                self?.adapter.sections = $0
            }
            .disposed(by: self.disposeBag)
    }
}
