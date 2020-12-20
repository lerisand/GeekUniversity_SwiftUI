//
//  NewsPageViewController.swift
//  Vkontakte
//
//  Created by Lera on 20.12.20.
//

import UIKit

class NewsPageViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    var newsIndex = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        
        for index in workingNewsList {
            if !newsIndex.contains(String(index.newsDescription.first!)){
                newsIndex.append(String(index.newsDescription.first!))
            }
        }
    }
}

extension NewsPageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var newsRow = [NewsList]()
        for news in workingNewsList {
            if newsIndex[section].contains(news.newsDescription.first!) {
                newsRow.append(news)
            }
        }
        return newsRow.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsIndex.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell", for: indexPath) as! NewsListCell
        
        var newsRow = [NewsList]()
        for news in workingNewsList {
            
            if newsIndex[indexPath.section].contains(news.newsDescription.first!) {
            newsRow.append(news)
            }
        }
        
        cell.newsDescriptionLabel.text = newsRow[indexPath.row].newsDescription
        cell.newsImage.image = newsRow[indexPath.row].newsImage
        
        return cell
    }
    
}

