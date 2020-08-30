//
//  MainProtocols.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import Foundation

// View / Presenter
protocol MainViewInjection : class {
    func loadItems(_ items: [MainViewModel])
}

protocol MainPresenterDelegate : class {
    func viewDidLoad()
}

// Presenter / Interactor
protocol MainInteractorDelegate : class {
    func getItems() -> [MainViewModel]
}

// Presenter / Router
protocol MainRouterDelegate : class {
    //__ Define your router protocols here
}
