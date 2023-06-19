//
//  PlacesResultsVC+PlacesResultsVCContract.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

import UIKit

extension PlacesResultsVC: PlacesResultsVCContract {
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(.init(nibName: HardCoded.placesCell.get(), bundle: nil), forCellReuseIdentifier: HardCoded.placesCell.get())
        tableView.backgroundColor = .clear
    }
    
    func configureViewController() {
        view.backgroundColor = .clear.withAlphaComponent(0.1)
    }
}
