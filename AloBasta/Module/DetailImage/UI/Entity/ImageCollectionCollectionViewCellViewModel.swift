//
//  ImageCollectionCollectionViewCellViewModel.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct ImageCollectionCollectionViewCellViewModel: CellRepresentable {
    
    var imgURL: String?
    
    init(imgURL: String?) {
        self.imgURL = imgURL
    }
    
    var type: String = {
        return DetailImageCellType.list.rawValue
    }()
    
}
