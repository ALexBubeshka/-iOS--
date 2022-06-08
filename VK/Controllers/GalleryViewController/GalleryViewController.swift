import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let customCollectionViewCell = "CustomCollectionViewCellReuseIdentifier"

    var fotoAlbum = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: customCollectionViewCell)
        
    
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

}
