//
//  NewsSearchInteractor.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

protocol NewsSearchInteractorInputProtocol: class {
    var presenter: NewsSearchInteractorOutputProtocol? { get set }
    
    func executeSearch(query: String)
}

class NewsSearchInteractor: NewsSearchInteractorInputProtocol {
    weak var presenter: NewsSearchInteractorOutputProtocol?
    
    init() {}
    
    func executeSearch(query: String) {
        NewsApi.doQuery(url: "https://newsapi.org/v2/everything?q=\(query)&language=en&apiKey=2159dff3238f4299b65a8c3987216e7d") { page, error in
            if let pageOne = page, error == false {
                self.presenter?.searchSuccess(articles: pageOne)
            } else {
                self.presenter?.searchFailed()
            }
        }
    }
}
