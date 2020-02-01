//
//  AppDependencies.swift
//  NewsViper
//
//  Created by Ziurin, Maksim on 2020/01/25.
//  Copyright © 2020 Ziurin, Maksim. All rights reserved.
//

import Foundation
import UIKit

class AppDependencies{

    class func initWithWindow(window: UIWindow) -> AppDependencies
    {
        let obj = AppDependencies()
        
        obj.configureDependencies(window: window)
        
        return obj
    }
    

    var rootWireframe: RootRouter?
    
    func configureDependencies(window: UIWindow)
    {
        rootWireframe = RootRouter.init(window: window)
        rootWireframe!.installViewIntoRootViewController()
        
    }
}
