//
//  FriendPageCell.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import Foundation
import UIKit

class FriendPageCell: UICollectionViewCell {
    
    @IBOutlet weak var userPic: UIImageView!
    @IBOutlet weak var photoLikes: PhotoLikesControl!
    
    var friendIndex: Int = 0
    var photoCounter: Int = 0
    
    func setUpLikeControl() {
        photoLikes.indexLike = friendIndex
        photoLikes.photoCount = photoCounter
        photoLikes.setUpView()
    }
}
