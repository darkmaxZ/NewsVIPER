//
//  TopHeadlinesInteractor.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

protocol TopHeadlinesInteractorInputProtocol: class {
    var presenter: TopHeadlinesInteractorOutputProtocol? { get set }
   
    func getTopHeadlines()
}

class TopHeadlinesInteractor: TopHeadlinesInteractorInputProtocol {
    weak var presenter: TopHeadlinesInteractorOutputProtocol?

    func getTopHeadlines() {
        NewsApi.doQuery(url: "https://newsapi.org/v2/top-headlines?country=us&apiKey=2159dff3238f4299b65a8c3987216e7d") { page, error in
            if let pageOne = page, error == false {
                self.presenter?.getTopHeadlinesSuccess(articles: pageOne)
            } else {
                self.presenter?.getTopHeadlinesFailed()
            }
        }
    }
}
