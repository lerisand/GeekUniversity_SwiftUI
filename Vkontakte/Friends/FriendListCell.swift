//
//  FriendListCell.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import Foundation
import UIKit

class FriendListCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPic: SmallProfilePicView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
