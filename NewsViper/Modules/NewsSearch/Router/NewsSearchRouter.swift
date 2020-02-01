//
//  NewsSearchRouter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

protocol NewsSearchRouterProtocol: class {
    static func presentNewsSearchModule(fromView view: AnyObject)
    
    func showArticleDetails(article: Article)
}

class NewsSearchRouter: NewsSearchRouterProtocol, TabBarProtocol {
    var tabIcon:UIImage = UIImage(systemName: "magnifyingglass")!
    var tabTitle:String = "News search"
    var navigationController: UINavigationController!
    
    
    static func presentNewsSearchModule(fromView view: AnyObject) {
        // Generating module components
        let presenter: NewsSearchPresenterProtocol & NewsSearchInteractorOutputProtocol = NewsSearchPresenter()
        let interactor: NewsSearchInteractorInputProtocol = NewsSearchInteractor()
        let router: NewsSearchRouterProtocol = NewsSearchRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: NewsSearchViewProtocol = storyboard.instantiateViewController(withIdentifier: "NewsSearchView") as! NewsSearchView
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
       
    }
    
    func configuredNavigationController() -> UINavigationController {
        let presenter: NewsSearchPresenterProtocol & NewsSearchInteractorOutputProtocol = NewsSearchPresenter()
        let interactor: NewsSearchInteractorInputProtocol = NewsSearchInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: NewsSearchViewProtocol = storyboard.instantiateViewController(withIdentifier: "NewsSearchView") as! NewsSearchView
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let tabBarItem = UITabBarItem()
        tabBarItem.image = tabIcon
        tabBarItem.title = tabTitle
        navigationController = UINavigationController(rootViewController: view as! UIViewController)
        navigationController.tabBarItem = tabBarItem
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.title = tabTitle
        
        return navigationController
    }
    
    func showArticleDetails(article: Article) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailsView: ArticleDetailsView = storyboard.instantiateViewController(withIdentifier: "ArticleDetailsView") as! ArticleDetailsView
        detailsView.article = article
        navigationController.pushViewController(detailsView, animated: true)
    }
}
