//
//  FriendsRecord.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

struct FriendsRecord: Equatable {
    var friendName: String
    var friendPhoto: [FriendPhoto]
}

struct FriendPhoto: Equatable {
    var photoName: UIImage
    var isPhotoLiked: Bool
    var photoLikesNumber: Int
}

var friendsListCatalogue = [
    FriendsRecord(friendName: "Никита Сергеев", friendPhoto: [FriendPhoto(photoName: UIImage(named: "boy1")!, isPhotoLiked: true, photoLikesNumber: 1), FriendPhoto(photoName: UIImage(named: "friendPost1")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Николай Борисов", friendPhoto: [FriendPhoto(photoName: UIImage(named: "man1")!, isPhotoLiked: true, photoLikesNumber: 1), FriendPhoto(photoName: UIImage(named: "friendPost2")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost3")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Артем Сарана", friendPhoto: [FriendPhoto(photoName: UIImage(named: "boy2")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost4")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Александр Фомин", friendPhoto: [FriendPhoto(photoName: UIImage(named: "man4")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost5")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Юрий Федеров", friendPhoto: [FriendPhoto(photoName: UIImage(named: "man6")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost6")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Анна Панфилова", friendPhoto: [FriendPhoto(photoName: UIImage(named: "woman1")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost7")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Татьяна Сундукова", friendPhoto: [FriendPhoto(photoName: UIImage(named: "woman2")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost8")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Виталий Степушин", friendPhoto: [FriendPhoto(photoName: UIImage(named: "man8")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost9")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Катя Смирнова", friendPhoto: [FriendPhoto(photoName: UIImage(named: "woman6")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost1")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Василий Князев", friendPhoto: [FriendPhoto(photoName: UIImage(named: "man9")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost1")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Хасан Сатияджев", friendPhoto: [FriendPhoto(photoName: UIImage(named: "rockstar1")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost2")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Никита Грас", friendPhoto: [FriendPhoto(photoName: UIImage(named: "hipster1")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost3")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
    FriendsRecord(friendName: "Даниил Книсс", friendPhoto: [FriendPhoto(photoName: UIImage(named: "boy3")!, isPhotoLiked: false, photoLikesNumber: 2), FriendPhoto(photoName: UIImage(named: "friendPost4")!, isPhotoLiked: false, photoLikesNumber: 2) ]),
]

var workingFriendsListCatalogue = friendsListCatalogue

