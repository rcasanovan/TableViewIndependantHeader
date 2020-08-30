//
//  MainInteractor.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import Foundation

class MainInteractor {
}

// MARK: - MainInteractorDelegate
extension MainInteractor: MainInteractorDelegate {

    /**
     Get the view model items
     */
    func getItems() -> [MainViewModel] {
        return MainViewModel.getViewModels()
    }
    
}
