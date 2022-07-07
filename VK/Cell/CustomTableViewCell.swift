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
    @IBOutlet weak var shadowView: UIView!
    
    var closure: (() -> Void)?
    
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
        fotoImageVIew.contentMode = .scaleAspectFill
        fotoImageVIew.layer.cornerRadius = 15
        shadowView.layer.cornerRadius = 15
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 7, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.5
        
    }
    func configureOne (image: UIImage?, name: String?, discriprion: String?, closure: @escaping () -> Void ){
        fotoImageVIew.image = image
        NameLabel.text = name
        descriptionLabel.text = discriprion
        self.closure = closure
        fotoImageVIew.contentMode = .scaleAspectFill
        fotoImageVIew.layer.cornerRadius = 53
        shadowView.layer.cornerRadius = 53
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 7, height: 5)
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOpacity = 0.5
    }
    
    
    
    func configure (_ group: Group){
        
        fotoImageVIew.image = UIImage(named: group.avatar)
        NameLabel.text = group.name
        descriptionLabel.text = group.description
      
    }
    
    @IBAction func pressImageView(_ sender: UIButton) {
        
             UIView.animate(withDuration: 0.5) { [weak self] in
                 
                 self?.fotoImageVIew.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                 self?.shadowView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

             } completion: { _ in UIView.animate(withDuration: 0.5) { [weak self] in
                 
                     self?.fotoImageVIew.transform = CGAffineTransform(scaleX: 1, y: 1)
                     self?.shadowView.transform = CGAffineTransform(scaleX: 1, y: 1)

                     } completion: { [weak self] _ in
                         
                         self?.closure?()
             }
         }
    }
    
    
}
