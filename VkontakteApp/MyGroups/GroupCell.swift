//
//  GroupCell.swift
//  VkontakteApp
//
//  Created by Lera on 15.12.20.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var allGroupsName: UILabel!
    @IBOutlet weak var groupName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
