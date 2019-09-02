//
//  ArticleListViewModel.swift
//  FitToPrint
//
//  Created by William Chapman on 8/23/19.
//  Copyright © 2019 William Chapman. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ArticleViewModel: Identifiable {
    let id = UUID()
    var article: Article
    
    init(article: Article) {
        self.article = article
    }
    
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description ?? ""
    }
    
    var urlToImage: String {
        return self.article.urlToImage ?? ""
    }
    
    var url: URL {
        return URL(string: self.article.urlToImage!)!
    }
    
//    var example: ExampleView {
//        
//        if let tangerines = URL(string: urlToImage) {
//            let fetcher = ImageFetcher(url: tangerines)
//            return ExampleView(fetcher: fetcher)
//        }
//        return ExampleView(fetcher: ImageFetcher(url: URL(string: urlToImage)!))
//    }


//    var image: AsyncImageView {
//        return AsyncImageView(with: urlToImage)
//    }
    

}

class ArticleListViewModel: ObservableObject {
    
    @Published var articles = [ArticleViewModel]()
    
    init() {
        fetchTopHeadlines()
    }
    
    private func fetchTopHeadlines() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=3003083aef194c5596323ee23c4882f6") else {
            fatalError("URL is not correct!")
        }
            
        Webservice().loadHeadlines(url: url) { articles in
            if let newArticles = articles {
                self.articles = newArticles.map(ArticleViewModel.init)
            }
        }
    }
}
