//
//  SearchResultsVC.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

final class SearchResultsVC: UIViewController {
    
    var spinner: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MapVM!
    
    init(pass viewModel: MapVM) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.viewModel.searchResultView = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.searchResultsView_viewDidLoad()
    }

}
