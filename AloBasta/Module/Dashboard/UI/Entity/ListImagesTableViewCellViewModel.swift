//
//  ListImagesTableViewCellViewModel.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct ListImagesTableViewCellViewModel: CellRepresentable {
    
    init() {
        
    }
    
    var type: String = {
        return DashboardCellType.list.rawValue
    }()
    
}
