//
//  TabBarViewProtocol.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

protocol TabBarProtocol {
    
    var tabIcon: UIImage { get }
    var tabTitle: String { get }
    
    func configuredNavigationController() -> UINavigationController
}
