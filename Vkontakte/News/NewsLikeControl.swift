//
//  NewsLikeControl.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

class NewsLikesControl: UIControl {
    var likesImage = UIImageView()
    var likesCount = UILabel()
    var indexLike: Int = 0
    var photoCount: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = nil
        
        likesImage.frame.size.height = self.frame.height
        likesImage.frame.size.width = likesImage.frame.height
        
        self.addSubview(likesImage)
        
        likesCount.frame.size.height = self.frame.height
        self.addSubview(likesCount)
        
        likesCount.translatesAutoresizingMaskIntoConstraints = false
        likesImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint(item: likesCount, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: self, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: likesCount, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: likesImage, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: 1).isActive = true
        NSLayoutConstraint(item: likesCount, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: likesImage, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 1).isActive = true
        
        likesCount.font = likesCount.font.withSize(10)
        
        if friendsListCatalogue[indexLike].friendPhoto[photoCount].isPhotoLiked {
            likesImage.image = UIImage(systemName: "heart.fill")
            likesCount.textColor = .red
        }
            
        else {
            likesImage.image = UIImage(systemName: "heart")
        }
        
        likesCount.text = String(friendsListCatalogue[indexLike].friendPhoto[photoCount].photoLikesNumber)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        if friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].isPhotoLiked {
            self.likesImage.image = UIImage(systemName: "heart")
            friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].photoLikesNumber -= 1
            friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].isPhotoLiked = false
            self.likesCount.text = String(friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].photoLikesNumber)
            likesCount.textColor = .black
            
        }
            
        else {
            self.likesImage.image = UIImage(systemName: "heart.fill")
            friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].photoLikesNumber += 1
            friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].isPhotoLiked = true
            self.likesCount.text = String(friendsListCatalogue[self.indexLike].friendPhoto[self.photoCount].photoLikesNumber)
            likesCount.textColor = .red
        }
        
        return false
    }
}

