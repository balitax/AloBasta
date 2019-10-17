//
//  DashboardViewModel.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class DashboardViewModel {
    
    
    private(set) var items: [[CommonDashboardViewCellKind]] = []
    
    init() {
        items = [
            [
                .list,
                .list,
                .list,
                .list,
                .list,
                .list,
                .list,
                .list,
                .list,
                .list
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .list:
            return ListImagesTableViewCellViewModel()
        }
    }
    
}
