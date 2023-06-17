//
//  SearchResultsVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

class SearchResultsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MapVM
    
    init(viewModel: MapVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "SearchCell")
        tableView.backgroundColor = .clear
    }
}
