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
        tableView.separatorStyle = .none
        self.view.backgroundColor = .clear
        
        spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .green
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    func dumpData() {
        viewModel.suggestionResults.removeAll()
        tableView.reloadData()
    }
    
    func startSpinner(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            spinner.startAnimating()
        }
    }
    func stopSpinner(){
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            spinner.stopAnimating()
        }
    }
}

