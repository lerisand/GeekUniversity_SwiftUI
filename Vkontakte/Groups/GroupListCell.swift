//
//  GroupListCell.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import Foundation
import UIKit

class GroupListCell: UITableViewCell {
    @IBOutlet weak var groupName: UILabel!
    @IBOutlet weak var groupPic: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
