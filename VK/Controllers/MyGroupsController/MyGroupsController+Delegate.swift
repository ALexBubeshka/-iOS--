
import UIKit

extension MyGroupsController: UICollectionViewDelegate {
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
         print(indexPath.item)
    }
}
