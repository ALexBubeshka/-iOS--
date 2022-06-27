
import UIKit

class MyFriendsController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let fromFriendsListToGallery = "fromFriendsListToGallery"
    
    let CustomTableViewReuseIdentifier = "CustomTableViewReuseIdentifier"
    
    func fillData() -> [Friend] {
        let friend1 = Friend (name: "Вадим", age: "31", avatar: "Вадим", fotoAlbum:["Вадим"])
        let friend2 = Friend (name: "Александр", age: "32", avatar: "Вадим1", fotoAlbum:["Вадим","Вадим1","Вадим2"])
        let friend3 = Friend (name: "Егор", age: "32", avatar: "Вадим2", fotoAlbum:["Вадим2"])
        var friendsArray = [Friend]()
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        return friendsArray
    }
    
    var sourceFriends = [Friend]()
    var myFriends = [Friend]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        myFriends = fillData()
        sourceFriends = myFriends
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        
    }
    // удаление строки
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myFriends.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
extension MyFriendsController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText .isEmpty {
            myFriends = sourceFriends
        } else {
            myFriends = sourceFriends.filter({ friendItem in
                friendItem.name.lowercased().contains(searchText.lowercased())
            })
        }
        
        
        tableView.reloadData()
    }
}

