//
//  MainViewController.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import UIKit

//__ This class extends UIViewController. Feel free to modify it if needed
class MainViewController: UIViewController {
    
    public var presenter: MainPresenterDelegate?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
}

// MARK: - Setup views
extension MainViewController {
    
    /**
     Setup views
     */
    private func setupViews() {
        //__ Configure your view here
        //__ Background color, title, safe area
        view.backgroundColor = .yellow
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     Configure subviews
     */
    private func configureSubviews() {
        //__ Configure all the subviews here
    }
    
}

// MARK: - Layout & constraints
extension MainViewController {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        //__ Add all the subviews here
        
        //__ Configure the constraints
    }

}

// MARK: - MainViewInjection
extension MainViewController: MainViewInjection {
    
    func loadItems(_ items: [MainViewModel]) {
        
    }
    
}
