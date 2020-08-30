//
//  MainPresenter.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import UIKit

class MainPresenter {
    
    private weak var view: MainViewInjection?
    private let interactor: MainInteractorDelegate
    private let router: MainRouterDelegate
    
    // MARK: Lifecycle
    init(view: MainViewInjection, navigationController: UINavigationController? = nil) {
        self.view = view
        self.interactor = MainInteractor()
        self.router = MainRouter(view: view, navigationController: navigationController)
    }
    
}

// MARK: - MainPresenterDelegate
extension MainPresenter: MainPresenterDelegate {
    //__ Implement your protocols here
}
