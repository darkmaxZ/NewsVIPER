//
//  TopHeadlinesRouter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

protocol TopHeadlinesRouterProtocol: class
{
    static func presentTopHeadlinesModule(fromView view: AnyObject)
    
    func showArticleDetails(article: Article)
}

class TopHeadlinesRouter: TopHeadlinesRouterProtocol, TabBarProtocol {
    var tabIcon:UIImage = UIImage(systemName: "globe")!
    var tabTitle:String = "Top headlines"
    var navigationController: UINavigationController!
    
    static func presentTopHeadlinesModule(fromView view: AnyObject) {
        // Generating module components
        var presenter: TopHeadlinesPresenterProtocol & TopHeadlinesInteractorOutputProtocol = TopHeadlinesPresenter()
        let interactor: TopHeadlinesInteractorInputProtocol = TopHeadlinesInteractor()
        let router: TopHeadlinesRouterProtocol = TopHeadlinesRouter()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: TopHeadlinesViewProtocol = storyboard.instantiateViewController(withIdentifier: "TopHeadlinesView") as! TopHeadlinesView
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
       
    }
    
    func configuredNavigationController() -> UINavigationController {
        var presenter: TopHeadlinesPresenterProtocol & TopHeadlinesInteractorOutputProtocol = TopHeadlinesPresenter()
        let interactor: TopHeadlinesInteractorInputProtocol = TopHeadlinesInteractor()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view: TopHeadlinesViewProtocol = storyboard.instantiateViewController(withIdentifier: "TopHeadlinesView") as! TopHeadlinesView
        
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        let tabBarItem = UITabBarItem()
        tabBarItem.image = tabIcon
        tabBarItem.title = tabTitle
        navigationController = UINavigationController(rootViewController: view)
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
