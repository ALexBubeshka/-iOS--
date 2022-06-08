//
//  CustomTableViewCell.swift
//  VK
//
//  Created by Alexander Bubeshka on 3.06.22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var fotoImageVIew: UIImageView!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
  
    func configure (image: UIImage?, name: String?, discriprion: String?){
        fotoImageVIew.image = image
        NameLabel.text = name
        descriptionLabel.text = discriprion
    }
}
