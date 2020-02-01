//
//  TabBarRouter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarRouterProtocol: class {
    static func installIntoWindow(rootRouter: RootRouter, window: UIWindow, routers: [TabBarProtocol]) -> TabBarRouterProtocol
    var rootRouter: RootRouter? { get set }
}

class TabBarRouter: TabBarRouterProtocol {
    var rootRouter: RootRouter?
    
    static func installIntoWindow(rootRouter: RootRouter, window: UIWindow, routers: [TabBarProtocol]) -> TabBarRouterProtocol {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                
        let view: TabBarViewProtocol = storyboard.instantiateInitialViewController() as! TabBarView
        let presenter: TabBarPresenterProtocol & TabBarInteractorOutputProtocol = TabBarPresenter()
        let interactor: TabBarInteractorInputProtocol = TabBarInteractor()
        let router: TabBarRouterProtocol = TabBarRouter()
        
        router.rootRouter = rootRouter
        // Connecting
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        
        var viewControllers = [UIViewController]()
        
        for router in routers {
            viewControllers.append(router.configuredNavigationController())
        }
        
        //installing tabBarController into window
        //rest interactions can be done VIPER way
        let tabBarController = view as! UITabBarController
        tabBarController.viewControllers = viewControllers
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        return router
    }

}
