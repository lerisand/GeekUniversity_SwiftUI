//
//  NewsList.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

struct NewsList: Equatable {
    var newsDescription: String!
    var newsImage: UIImage!
    var isNewsLiked: Bool!
    var newsLikesNumber: Int!
}

var newsList = [
NewsList(newsDescription: "Как успеть купить подарки и не сайти с ума?", newsImage: UIImage(named: "news2")!, isNewsLiked: true, newsLikesNumber: 10),
NewsList(newsDescription: "Breaking news, who won ellection 2020 in USA?", newsImage: UIImage(named: "news2")!, isNewsLiked: true, newsLikesNumber: 10),
]

var workingNewsList = newsList

