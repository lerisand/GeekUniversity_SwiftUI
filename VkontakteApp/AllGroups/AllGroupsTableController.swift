//
//  AllGroupsTableController.swift
//  VkontakteApp
//
//  Created by Lera on 15.12.20.
//

import UIKit

class AllGroupsTableController: UITableViewController {

    var allGroups = [
        "MXK",
        "TJ",
        "Daily Wisdom",
        "Physics, Math, Code",
        "Humanite",
        "Mental Engineering",
    ]

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allGroups.count
    }


     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath)
            as? GroupCell
        else { return UITableViewCell() }
        cell.groupName.text = allGroups[indexPath.row]

        // Configure the cell...
        return cell
    }

     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath)
     }

}
