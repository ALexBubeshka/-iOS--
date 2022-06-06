
import UIKit

class MyGroupsController: UIViewController {
 
    @IBOutlet weak var groupsCollectionView: UICollectionView!
    
    let customCollectionViewCell = "CustomCollectionViewCellReuseIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupsCollectionView.register(UINib(nibName: "CustomCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: customCollectionViewCell)
        
        groupsCollectionView.dataSource = self
        groupsCollectionView.delegate = self

    }
}


