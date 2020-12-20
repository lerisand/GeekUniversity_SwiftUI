//
//  FriendsListViewController.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

class FriendsListViewController: UIViewController {
    @IBOutlet weak var friendSearch: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var friendsIndex = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        friendSearch.delegate = self
        tableView.register (UINib (nibName: "NameLetterView" , bundle: nil ), forCellReuseIdentifier: "NameLetterCell" )
        self.tableView.tableFooterView = UIView()
        
        for index in workingFriendsListCatalogue {
            if !friendsIndex.contains(String(index.friendName.first!)){
                friendsIndex.append(String(index.friendName.first!))
            }
        }
    }
}

extension FriendsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var friendRow = [FriendsRecord]()
        for friend in workingFriendsListCatalogue {
            if friendsIndex[section].contains(friend.friendName.first!) {
                friendRow.append(friend)
            }
        }
        return friendRow.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsIndex.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsIndex[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendListCell", for: indexPath) as! FriendListCell
        
        var friendRow = [FriendsRecord]()
        for friend in workingFriendsListCatalogue {
            if friendsIndex[indexPath.section].contains(friend.friendName.first!) {
                friendRow.append(friend)
            }
        }
        
        cell.userName.text = friendRow[indexPath.row].friendName
        cell.userPic.avatarImage.image = friendRow[indexPath.row].friendPhoto[0].photoName
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FriendListActionSegue" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let destination = segue.destination as? FriendPageViewController
            
            var indexRowCounter = 0
            
            for index in 0..<indexPath!.section {
                indexRowCounter += self.tableView.numberOfRows(inSection: index)
            }
            
            indexRowCounter += indexPath!.row
            
            destination!.selectedFriend = indexRowCounter
        }
    }
}

extension FriendsListViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        workingFriendsListCatalogue = searchText.isEmpty ? friendsListCatalogue : friendsListCatalogue.filter { (item: FriendsRecord) -> Bool in
            return item.friendName.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        friendsIndex = [String]()
        
        for index in workingFriendsListCatalogue {
            if !friendsIndex.contains(String(index.friendName.first!)){
                friendsIndex.append(String(index.friendName.first!))
            }
        }
        
        workingFriendsListCatalogue.sort {
            $0.friendName < $1.friendName
        }
        
        friendsIndex.sort()
        self.tableView.reloadData()
    }
}
