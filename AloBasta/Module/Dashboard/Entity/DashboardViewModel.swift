//
//  DashboardViewModel.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class DashboardViewModel {
    
    var pixabay: [Hit] = [Hit]()
    
    private(set) var items: [[CommonDashboardViewCellKind]] = []
    
    init() {
        items = [
            [
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
                .listDoctor,
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .listDoctor:
            return ListDocterTableViewCellViewModel()
            
        }
    }
    
}
