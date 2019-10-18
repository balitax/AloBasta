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
                .list,
                .list,
                .list,
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        let index = indexPath.row
        
        switch type {
        case .list:
            if pixabay.isEmpty {
                return ListImagesTableViewCellViewModel(imgURL: "")
            } else {
                return ListImagesTableViewCellViewModel(imgURL: pixabay[index].previewURL)
            }
            
        }
    }
    
    func createItems() {
        var list: [CommonDashboardViewCellKind] = []
        
        for _ in pixabay {
            list.append(.list)
        }
        
        items.removeAll()
        items.append(list)
    }
    
}
