//
//  SearchResultsVC+UITableViewDatasource.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 17.06.2023.
//

import UIKit

extension SearchResultsVC: UITableViewDataSource {
    
    // TODO: Category and Places --> You need 2 Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.suggestionResultsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = self.tableView.dequeueReusableCell(withIdentifier: HardCoded.searchCell.get()) as! SearchCell
        resultCell.indexPath = indexPath
        resultCell.delegate = self
        resultCell.configure(with: viewModel.suggestionResults[indexPath.row])
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.mapView?.dismissPresentingSuggestionsList()
        let selectedRowIndex = indexPath.row
        viewModel.suggestionSelected(with: selectedRowIndex)
    }

}

