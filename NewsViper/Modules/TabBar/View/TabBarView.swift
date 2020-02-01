//
//  TabBarView.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarViewProtocol: class {
    var presenter: TabBarPresenterProtocol? { get set }
}

class TabBarView: UITabBarController, TabBarViewProtocol {
    var presenter: TabBarPresenterProtocol?
}
