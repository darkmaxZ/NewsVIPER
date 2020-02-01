//
//  RootRouter.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

class RootRouter: NSObject {
    var window: UIWindow!
    var tabBarRouter: TabBarRouterProtocol?
    
    init(window: UIWindow){
        super.init()
        self.window = window
    }
    
    func installViewIntoRootViewController() {
        
        var routers = [TabBarProtocol]()

        let topHeadlinesRouter : TopHeadlinesRouterProtocol = TopHeadlinesRouter()
        routers.append(topHeadlinesRouter as! TabBarProtocol)
        
        let newsSearchRouter: NewsSearchRouterProtocol = NewsSearchRouter()
        routers.append(newsSearchRouter as! TabBarProtocol)
        
        self.tabBarRouter = TabBarRouter.installIntoWindow(rootRouter: self, window: self.window, routers: routers)
    }
}
