//
//  ListDocterTableViewCellViewModel.swift
//  AloBasta
//
//  Created by Agus Cahyono on 22/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import Foundation

struct ListDocterTableViewCellViewModel: CellRepresentable {
    
    init() {
    }
    
    var type: String = {
        return DashboardCellType.listDoctor.rawValue
    }()
    
}
