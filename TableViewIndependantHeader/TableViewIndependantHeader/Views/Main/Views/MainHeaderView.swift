//
//  MainHeaderView.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import UIKit

//__ This class extends UIView. Feel free to modify it if needed
class MainHeaderView: UIView {
    
    public static var height: CGFloat {
        return 200.0
    }
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
}

// MARK: - Setup views
extension MainHeaderView {
    
    /**
     Setup views
     */
    private func setupViews() {
        //__ Configure your view here
        //__ Background color, title, safe area
        backgroundColor = .yellow
        
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
extension MainHeaderView {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        //__ Add all the subviews here
        
        //__ Configure the constraints
    }

}
