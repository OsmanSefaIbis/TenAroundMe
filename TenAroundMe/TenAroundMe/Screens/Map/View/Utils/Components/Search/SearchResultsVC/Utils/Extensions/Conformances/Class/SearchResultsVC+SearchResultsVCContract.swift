//
//  SearchResultsVC+SearchResultsVCContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 18.06.2023.
//

import UIKit

extension SearchResultsVC: SearchResultsVCContract {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: HardCoded.searchCell.get(), bundle: nil), forCellReuseIdentifier: HardCoded.searchCell.get())
        tableView.backgroundColor = .clear
    }
}
