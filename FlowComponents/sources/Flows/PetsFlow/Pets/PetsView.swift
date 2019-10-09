//
//  PetsView.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import TableAdapter

public enum PetsViewModelEvents: Events {
    
}

public class PetsView: MVVMView<PetsViewModel, PetsConfigurator, PetsViewModelEvents> {
    
    @IBOutlet private var tableView: UITableView?
    
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
      
    }
    
    private func handle(events: PetTableViewCellEvents) {
        
    }
    
    //MARK: -
    //MARK: Overrided
    
    override func fill(with viewModel: PetsViewModel) {
        self.adapter.sections = [Section(
            cell: PetTableViewCell.self,
            models: viewModel.petsValues,
            eventHandler: { [weak self] in self?.handle(events: $0) }
        )]
    }
}
