
import UIKit

extension MyGroupViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellReuse, for: indexPath) as! CustomTableViewCell
        
        cell.configure(self.groups[indexPath.row])
        return cell
    }
}
