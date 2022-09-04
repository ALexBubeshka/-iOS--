
import UIKit

class AllGroupViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    func fillData() -> [Group] {
        
        let group1 = Group(name: "Шахматный клуб", description: "Гродно", avatar: "chess")
        let group2 = Group(name: "Клуб любителей бега", description: "Беларусь", avatar: "run")
        let group3 = Group(name: "Триатлон", description: "Минск", avatar: "Tri")
        let group4 = Group(name: "Шахматы", description: "Минск", avatar: "chess1")
        let group5 = Group(name: "Run", description: "Гродно", avatar: "run1")
        let group6 = Group(name: "Triathlon", description: "Беларусь", avatar: "Tri1")
        let group7 = Group(name: "Apple", description: "Москва", avatar: "apple")
        var groups = [Group]()
        groups.append(group1)
        groups.append(group2)
        groups.append(group3)
        groups.append(group4)
        groups.append(group5)
        groups.append(group6)
        groups.append(group7)
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
