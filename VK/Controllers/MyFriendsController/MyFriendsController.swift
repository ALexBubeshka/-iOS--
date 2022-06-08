
import UIKit

class MyFriendsController: UIViewController {
    
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
