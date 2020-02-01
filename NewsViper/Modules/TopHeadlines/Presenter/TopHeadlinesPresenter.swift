//
//  TopHeadlinesPresenter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

protocol TopHeadlinesInteractorOutputProtocol: class {
    func getTopHeadlinesSuccess(articles: [Article])
    
    func getTopHeadlinesFailed()
}

protocol TopHeadlinesPresenterProtocol {
    var view: TopHeadlinesViewProtocol? { get set }
    var interactor: TopHeadlinesInteractorInputProtocol? { get set }
    var router: TopHeadlinesRouterProtocol? { get set }
    
    func getTopHeadlines()
    
    func showArticleDetails(article: Article)
}

class TopHeadlinesPresenter: TopHeadlinesPresenterProtocol {
    weak var view: TopHeadlinesViewProtocol?
    var interactor: TopHeadlinesInteractorInputProtocol?
    var router: TopHeadlinesRouterProtocol?
    
    init() {}
    
    func getTopHeadlines() {
        interactor?.getTopHeadlines()
    }
    
    func showArticleDetails(article: Article) {
        router?.showArticleDetails(article: article)
    }
}

extension TopHeadlinesPresenter: TopHeadlinesInteractorOutputProtocol {
    func getTopHeadlinesSuccess(articles: [Article]) {
        view?.showArticles(articles: articles)
    }
    
    func getTopHeadlinesFailed() {
        view?.showError()
    }
}
