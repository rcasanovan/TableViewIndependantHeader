//
//  MainViewModel.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import Foundation

struct MainViewModel {
    
    let title: String
    
}

extension MainViewModel {
    
    public static func getViewModels() -> [MainViewModel] {
        var viewModels: [MainViewModel] = []
        
        for i in 0...50 {
            viewModels.append(MainViewModel(title: "Test title at \(i) row"))
        }
        
        return viewModels
    }
    
}
