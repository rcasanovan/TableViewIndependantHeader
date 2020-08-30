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
    
    private let mainHeaderView: MainHeaderView = MainHeaderView()
    private let containerView: UIView = UIView()
    private var tableView: UITableView?
    private var datasource: MainDatasource?
    
    private var previousOffset: CGFloat?
    
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
        tableView?.delegate = self
        
        registerCells()
        setupDatasource()
    }
    
    /**
     Register cells
    */
    private func registerCells() {
        tableView?.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
    }
    
    /**
     Setup the data source
    */
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
        view.addSubview(mainHeaderView)
        view.addSubview(containerView)
        
        mainHeaderView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(0.0)
            $0.height.equalTo(MainHeaderView.height)
        }
        
        containerView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(mainHeaderView.snp.bottom)
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

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            return
        }
        
        mainHeaderView.snp.updateConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(-scrollView.contentOffset.y)
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
