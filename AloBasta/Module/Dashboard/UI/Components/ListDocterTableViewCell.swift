//
//  ListDocterTableViewCell.swift
//  AloBasta
//
//  Created by Agus Cahyono on 22/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit

class ListDocterTableViewCell: UITableViewCell, CellConfigurable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with model: CellRepresentable) {
        
    }
    
}
