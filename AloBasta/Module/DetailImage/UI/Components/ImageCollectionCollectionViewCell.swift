//
//  ImageCollectionCollectionViewCell.swift
//  AloBasta
//
//  Created by Agus Cahyono on 17/10/19.
//  Copyright © 2019 Agus Cahyono. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCollectionCollectionViewCell: UICollectionViewCell, CellConfigurable {
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    var loading = LoadingPlaceholderView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.loading.cover(self)
    }
    
    func configure(with model: CellRepresentable) {
        if let data = model as? ImageCollectionCollectionViewCellViewModel {
            
            if let imgURL = data.imgURL, let imgToURL = URL(string: imgURL) {
                self.imageDetail.kf.setImage(with: imgToURL)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.loading.uncover()
            }
            
        }
    }

}
