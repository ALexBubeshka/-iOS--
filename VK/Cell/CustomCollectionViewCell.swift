//
//  CustomCollectionViewCell.swift
//  VK
//
//  Created by Alexander Bubeshka on 6.06.22.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fotoImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        fotoImageView.image = nil
    }
    
    func configure (image: UIImage?) {
        fotoImageView.image = image
        
    }

}
