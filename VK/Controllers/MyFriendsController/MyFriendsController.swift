
import UIKit

class MyFriendsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let CustomTableViewReuseIdentifier = "CustomTableViewReuseIdentifier"
    
    func fillData() -> [Friend] {
        let friend1 = Friend (name: "Вадим", age: "31", avatar: "Вадим", fotoAlbum:[])
        let friend2 = Friend (name: "Александр", age: "32", avatar: "Вадим1", fotoAlbum:[])
        let friend3 = Friend (name: "Егор", age: "32", avatar: "Вадим2", fotoAlbum:[])
        var friendsArray = [Friend]()
        friendsArray.append(friend1)
        friendsArray.append(friend2)
        friendsArray.append(friend3)
        return friendsArray
    }
    
    var myFriends = [Friend]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        myFriends = fillData()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewReuseIdentifier)
      
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

    }
}
