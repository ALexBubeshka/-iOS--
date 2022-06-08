
import UIKit

class AllGroupViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    func fillData() -> [Group] {
        
        let group1 = Group(name: "Шахматный клуб", description: "Гродно", avatar: "Вадим")
        let group2 = Group(name: "Клуб бега", description: "Беларусь", avatar: "Вадим1")
        let group3 = Group(name: "Триатлон", description: "Минск", avatar: "Вадим2")
        var groups = [Group]()
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        return groups
    }
    
    var groups = [Group]()
    
    let customTableViewCellReuse = "customTableViewCellReuse"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groups = fillData()
        
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: customTableViewCellReuse)
        tableView.dataSource = self
        tableView.delegate = self
       
    }
}
