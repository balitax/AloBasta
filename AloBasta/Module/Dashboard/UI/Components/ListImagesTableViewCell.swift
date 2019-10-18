//
//  ListImagesTableViewCell.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

class ListImagesTableViewCell: UITableViewCell, CellConfigurable {
    
    var loading = LoadingPlaceholderView()
    
    @IBOutlet weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.loading.cover(self)
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? ListImagesTableViewCellViewModel {
            
            if let imgURL = data.imgURL, let imgToURL = URL(string: imgURL) {
                self.imgView.kf.setImage(with: imgToURL)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.loading.uncover()
            }
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
