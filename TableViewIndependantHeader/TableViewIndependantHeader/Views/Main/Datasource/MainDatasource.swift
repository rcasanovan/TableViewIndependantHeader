//
//  MainDatasource.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import UIKit

class MainDatasource: NSObject {
    
    public var items: [MainViewModel]
    
    public override init() {
        items = []
        super.init()
    }
    
}

extension MainDatasource {
    
    /**
     Generate the cell
     - parameter tableview: The tableview object
     - parameter indexPath: The current index path for the tableview cell
     */
    private func generateCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else {
            return UITableViewCell()
        }
        
        //__ Bind the cell
        let viewModel = items[indexPath.row]
        cell.bindWithViewModel(viewModel)
        
        return cell
    }
    
}

// MARK: - UITableViewDataSource
extension MainDatasource: UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return generateCell(tableView, cellForRowAt: indexPath)
    }
    
}
