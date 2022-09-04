//
//  ViewController.swift
//  VK
//
//  Created by Alexander Bubeshka on 30.06.22.
//

import UIKit

class ViewController: UIViewController {
        var imageGallerySelectedIndexPath = 0
        var imageGalleryFoto = [UIImage]()

    
    @IBOutlet weak var galleryView: ScrollGalleryController!
   
        override func viewDidLoad() {
            super.viewDidLoad()

            galleryView.setImages(images: imageGalleryFoto, imageGallerySelectedIndexPath: imageGallerySelectedIndexPath)
        }
}
