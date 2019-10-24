//
//  PetsView.swift
//  Navigation
//
//  Created by IDAP Developer on 9/17/19.
//  Copyright © 2019 Bendis. All rights reserved.
//

import UIKit

import TableAdapter

public class PetsView: MVVMView<PetsViewModel, PetsConfigurator, PetsViewModelOutputEvents, PetsViewModelInputEvents> {
    
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
    //MARK: Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.eventsEmiter.onNext(.needDowloadPets)
    }
    
    //MARK: -
    //MARK: Private
    
    private func handle(events: TableViewEvents) {
        switch events {
        case .didSelect(let index):
            self.eventsEmiter.onNext(.didSelecting(indexPath: index))
        default: break
        }
    }
    
    //MARK: -
    //MARK: Overrided
    
    override func fill(with viewModel: PetsViewModel) {
        let section = Section(cell: PetTableViewCell.self, models: viewModel.petsValues)
        self.adapter.sections = [section]
    }
}
