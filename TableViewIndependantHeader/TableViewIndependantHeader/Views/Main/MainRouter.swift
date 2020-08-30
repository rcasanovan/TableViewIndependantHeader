//
//  MainRouter.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import UIKit

class MainRouter {
    
    private weak var view: MainViewInjection?
    private weak var navigationController: UINavigationController?
    
    init(view: MainViewInjection? = nil, navigationController: UINavigationController? = nil) {
        self.view = view
        self.navigationController = navigationController
    }
    
    /**
     Setup the initial module
     */
    public static func setupModule(navigationController: UINavigationController? = nil) -> MainViewController {
        let mainVC = MainViewController()
        mainVC.presenter = MainPresenter(view: mainVC)
        return mainVC
    }
    
}

// MARK: - MainRouterDelegate
extension MainRouter: MainRouterDelegate {
    //__ Implement your protocols here
}
