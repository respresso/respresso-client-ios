//
//  ViewController.swift
//  hello-respresso-ios
//
//  Created by Robert Koltai on 2019. 01. 10..
//  Copyright © 2019. ponte Kft. All rights reserved.
//

import UIKit
import Respresso

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    fileprivate let dataSource = ExampleDataSource()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTitle()
        setupTableView()
    }
}

// MARK: - Private

private extension ViewController {
    
    func setupTitle() {
//        titleLabel.font = OpenSans.extrabold(withSize: 20)
//        titleLabel.textColor = RespressoColors.green
        titleLabel.text = RespressoStrings.helloRespresso
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = ExampleCell.estimateHeight
        
        tableView.dataSource = dataSource
    }
    
}

