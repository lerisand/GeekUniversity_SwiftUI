//
//  GroupsListViewController.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

class GroupsListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var groupsListCatalogue = [
        GroupsListItem(groupName: "Netflix", groupPic: UIImage(named: "netflix")!),
        GroupsListItem(groupName: "Huawei", groupPic: UIImage(named: "huawei")!),
        GroupsListItem(groupName: "Nike", groupPic: UIImage(named: "nike")!),
        GroupsListItem(groupName: "Stanford University", groupPic: UIImage(named: "stanford")!),
        GroupsListItem(groupName: "Best Movies 2020", groupPic: UIImage(named: "movies")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

extension GroupsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsListCatalogue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupListCell") as? GroupListCell else { fatalError() }
        
        cell.groupName.text = groupsListCatalogue[indexPath.row].groupName
        cell.groupPic.image = groupsListCatalogue[indexPath.row].groupPic
        
        print("Cell created for row: \(indexPath.row), \(groupsListCatalogue[indexPath.row])")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            groupsListCatalogue.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
