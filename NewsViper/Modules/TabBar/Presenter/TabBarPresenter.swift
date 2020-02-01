//
//  TabBarPresenter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

protocol TabBarPresenterProtocol: class {
    var view: TabBarViewProtocol? { get set }
    var interactor: TabBarInteractorInputProtocol? { get set }
    var router: TabBarRouterProtocol? { get set }
}

class TabBarPresenter: TabBarPresenterProtocol, TabBarInteractorOutputProtocol {
    weak var view: TabBarViewProtocol?
    var interactor: TabBarInteractorInputProtocol?
    var router: TabBarRouterProtocol?
    
    init() {}
}
