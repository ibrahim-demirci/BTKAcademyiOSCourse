//
//  NewsViewModel.swift
//  SwiftApiNewsApp
//
//  Created by İbrahim Demirci on 2.12.2021.
//

import Foundation

struct NewsTableViewModel {
    
    let newsList : [News]
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}

struct NewsViewModel{
    
    let news : News
    
    var title : String {
        return self.news.title
    }
    
    var story : String {
        return self.news.story
    }
    
    
}
