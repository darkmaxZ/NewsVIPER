//
//  TabBarInteractor.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation

protocol TabBarInteractorOutputProtocol: class {
}

protocol TabBarInteractorInputProtocol: class {
    var presenter: TabBarInteractorOutputProtocol? { get set }
}

class TabBarInteractor: TabBarInteractorInputProtocol {
    weak var presenter: TabBarInteractorOutputProtocol?
    init() {}
}
