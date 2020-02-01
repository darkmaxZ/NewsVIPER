//
//  NewsSearchPresenter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

protocol NewsSearchInteractorOutputProtocol: class {
    func searchSuccess(articles: [Article])
    
    func searchFailed()
}

protocol NewsSearchPresenterProtocol: class {
    var view: NewsSearchViewProtocol? { get set }
    var interactor: NewsSearchInteractorInputProtocol? { get set }
    var router: NewsSearchRouterProtocol? { get set }
    
    func searchByKeywords(keywords: String)
    
    func showArticleDetails(article: Article)
}

class NewsSearchPresenter: NewsSearchPresenterProtocol {
    weak var view: NewsSearchViewProtocol?
    var interactor: NewsSearchInteractorInputProtocol?
    var router: NewsSearchRouterProtocol?
    
    init() {}
    
    func searchByKeywords(keywords: String) {
        interactor?.executeSearch(query: keywords)
    }
    
    func showArticleDetails(article: Article) {
        router?.showArticleDetails(article: article)
    }
}

extension NewsSearchPresenter: NewsSearchInteractorOutputProtocol {
    func searchSuccess(articles: [Article]) {
        view?.showArticles(articles: articles)
    }
    
    func searchFailed() {
        view?.showError()
    }
}
