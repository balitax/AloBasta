//
//  DetailImageViewModel.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

class DetailImageViewModel {
    
    var pixabay: Hit?
    
    private(set) var items: [[CommonDetailImageViewCellKind]] = []
    
    init() {
        items = [
            [
                .collection,
                .collection,
                .collection,
                .collection,
                .collection,
            ]
        ]
    }
    
    func getItem(at indexPath: IndexPath) -> CellRepresentable {
        let type = items[indexPath.section][indexPath.row]
        switch type {
        case .collection:
            return ImageCollectionCollectionViewCellViewModel(imgURL: pixabay?.largeImageURL)
        }
    }
    
}
