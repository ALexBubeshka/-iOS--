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
        fotoImageVIew.layer.cornerRadius = 53
        fotoImageVIew.layer.shadowColor = UIColor.black.cgColor
        fotoImageVIew.layer.shadowOffset = CGSize(width: 20, height: 10)
        fotoImageVIew.layer.shadowRadius = 2
        fotoImageVIew.layer.shadowOpacity = 0.7
        
    }
    func configure (_ group: Group){
        fotoImageVIew.image = UIImage(named: group.avatar)
        NameLabel.text = group.name
        descriptionLabel.text = group.description
      
    }
    
}
