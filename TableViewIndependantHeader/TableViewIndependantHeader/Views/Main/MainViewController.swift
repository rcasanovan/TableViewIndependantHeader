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
    
    private let containerView: UIView = UIView()
    private var tableView: UITableView?
    private var datasource: MainDatasource?
    
    public var presenter: MainPresenterDelegate?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        presenter?.viewDidLoad()
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
        view.backgroundColor = .white
        
        configureSubviews()
        addSubviews()
    }
    
    /**
     Configure subviews
     */
    private func configureSubviews() {
        //__ Configure all the subviews here
        
        containerView.backgroundColor = .black
        tableView = UITableView(frame: containerView.bounds, style: .plain)
        tableView?.tableFooterView = UIView()
        tableView?.separatorStyle = .none
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.backgroundColor = .white
        tableView?.showsVerticalScrollIndicator = false
        
        registerCells()
        setupDatasource()
    }
    
    private func registerCells() {
        tableView?.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    private func setupDatasource() {
        if let tableView = tableView {
            datasource = MainDatasource()
            tableView.dataSource = datasource
        }
    }
    
}

// MARK: - Layout & constraints
extension MainViewController {
    
    /**
     Add subviews
     */
    private func addSubviews() {
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
        }
        
        if let tableView = tableView {
            containerView.addSubview(tableView)
            
            tableView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }

}

// MARK: - MainViewInjection
extension MainViewController: MainViewInjection {
    
    func loadItems(_ items: [MainViewModel]) {
        datasource?.items = items
        tableView?.reloadData()
    }
    
}
