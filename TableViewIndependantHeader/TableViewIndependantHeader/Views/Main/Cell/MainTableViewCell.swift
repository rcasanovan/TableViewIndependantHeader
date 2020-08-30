//
//  MainTableViewCell.swift
//  TableViewIndependantHeader
//
//  Created by Ricardo Casanova on 30/08/2020.
//  Copyright © 2020 Ricardo Casanova. All rights reserved.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    private let titleLabel: UILabel = UILabel()
    private let separatorView: UIView = UIView()
        
    static public var identifier: String {
        return String(describing: self)
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
        
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
        
    public func bindWithViewModel(_ viewModel: MainViewModel) {
        titleLabel.text = viewModel.title
    }
    
}

// MARK: - Setup views
extension MainTableViewCell {
    
    /**
     * SetupViews
     */
    private func setupViews() {
        backgroundColor = .white
        selectionStyle = .none
        accessoryType = .none
        
        configureSubviews()
        addSubviews()
    }
    
    private func configureSubviews() {
        titleLabel.font = UIFont.systemFont(ofSize: 18.0, weight: .medium)
        titleLabel.textColor = .black
        
        separatorView.backgroundColor = .black
    }
    
}

// MARK: - Layout & constraints
extension MainTableViewCell {
    
    /**
     * Add subviews
     */
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(separatorView)
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(15.0)
            $0.right.equalTo(-15.0)
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(57.0)
        }
                
        separatorView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(1.0)
        }
        
    }
    
}
