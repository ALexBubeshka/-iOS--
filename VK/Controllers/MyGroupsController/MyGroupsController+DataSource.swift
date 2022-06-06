import UIKit

extension MyGroupsController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCollectionViewCell, for: indexPath) as! CustomCollectionViewCell
        
        cell.configure(image: UIImage(named: "Вадим"))
        
        return cell
        
    }
}
