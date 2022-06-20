
import UIKit

extension MyFriendsController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewReuseIdentifier, for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        
        let friend = myFriends[indexPath.row]
        cell.configure(image: UIImage(named: friend.avatar!), name: friend.name, discriprion: friend.age)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myFriends.count
    }
}
